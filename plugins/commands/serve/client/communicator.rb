
module VagrantPlugins
  module CommandServe
    module Client
      class Communicator

        extend Util::Connector

        attr_reader :broker
        attr_reader :client
        attr_reader :proto

        def initialize(conn, proto, broker=nil)
          @logger = Log4r::Logger.new("vagrant::command::serve::client::communicator")
          @logger.debug("connecting to communicator service on #{conn}")
          @client = SDK::CommunicatorService::Stub.new(conn, :this_channel_is_insecure)
          @broker = broker
          @proto = proto
        end

        def self.load(raw_communicator, broker:)
          c = raw_communicator.is_a?(String) ? SDK::Args::Communicator.decode(raw_communicator) : raw_communicator
          self.new(connect(proto: c, broker: broker), c, broker)
        end

        # @param [Vagrant::Machine]
        # @return [bool]
        def ready(machine)
          req = SDK::FuncSpec::Args.new(
            args: [SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
            )]
          )
          @logger.debug("checking if communicator is ready")
          @logger.debug("Sending request #{req}")
          res = client.ready(req)
          @logger.debug("ready? #{res}")
          res.ready
        end

        # @param [Vagrant::Machine]
        # @param [Integer] duration Timeout in seconds.
        # @return [Boolean]
        def wait_for_ready(machine, time)
          req = SDK::FuncSpec::Args.new(
            args: [SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
            ),
            SDK::FuncSpec::Value.new(
              type: "hashicorp.vagrant.sdk.Args.TimeDuration",
              value: Google::Protobuf::Any.pack(
                SDK::Args::TimeDuration.new(duration: time)
              ),
            )
          ]
          )
          @logger.debug("(waiting) checking if communicator is ready")
          res = client.wait_for_ready(req)
          @logger.debug("ready? #{res}")
          res.ready
        end

        # @param [Vagrant::Machine]
        # @param [String] remote path
        # @param [String] local path
        def download(machine, from, to)
          req = SDK::FuncSpec::Args.new(
            args: [
              SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
              ),
              SDK::FuncSpec::Value.new(
                type: "hashicorp.vagrant.sdk.Communicator.Path",
                value: Google::Protobuf::Any.pack(SDK::Communicator::Path.new(path: from)),
              ),
              SDK::FuncSpec::Value.new(
                type: "hashicorp.vagrant.sdk.Communicator.RemotePath",
                value: Google::Protobuf::Any.pack(SDK::Communicator::RemotePath.new(path: to)),
              ),
            ]
          )

          @logger.debug("downloading #{from} -> #{to}")
          client.download(req)
        end

        # @param [Vagrant::Machine]
        # @param [String] local path
        # @param [String] remote path
        def upload(machine, from, to)
          req = SDK::FuncSpec::Args.new(
            args: [
              SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
              ),
              SDK::FuncSpec::Value.new(
                type: "hashicorp.vagrant.sdk.Communicator.Path",
                value: Google::Protobuf::Any.pack(SDK::Communicator::Path.new(path: from)),
              ),
              SDK::FuncSpec::Value.new(
                type: "hashicorp.vagrant.sdk.Communicator.RemotePath",
                value: Google::Protobuf::Any.pack(SDK::Communicator::RemotePath.new(path: to)),
              ),
            ]
          )

          @logger.debug("uploading #{from} -> #{to}")
          client.upload(req)
        end

        # @param [Vagrant::Machine]
        # @param [String] command to run
        # @param [Hash] options
        # @return [Integer]
        def execute(machine, cmd, opts)
          req = generate_execution_request(machine, cmd, opts)
          @logger.debug("excuting")
          res = client.execute(req)
          @logger.debug("excution result: #{res}")
          res.exit_code
        end

        # @param [Vagrant::Machine]
        # @param [String] command to run
        # @param [Hash] options
        # @return [Integer]
        def privileged_execute(machine, cmd, opts)
          req = generate_execution_request(machine, cmd, opts)
          @logger.debug("privleged excuting")
          res = client.privileged_execute(req)
          @logger.debug("privleged excution result: #{res}")
          res.exit_code
        end
      
        # @param [Vagrant::Machine]
        # @param [String] command to run
        # @param [Hash] options
        # @return [Boolean]
        def test(machine, cmd, opts)
          req = generate_execution_request(machine, cmd, opts)
          @logger.debug("testing")
          @logger.debug("Sending request #{req}")
          res = client.test(req)
          @logger.debug("test result? #{res}")
          res.valid
        end

        def reset(machine)
          req = SDK::FuncSpec::Args.new(
            args: [SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
            )]
          )
          @logger.debug("reseting communicator")
          client.reset(req)
        end

        protected

        def generate_execution_request(machine, cmd, opts={})
          # opts.each do |k,v| 
          #   val = Google::Protobuf::Value.new
          #   val.from_ruby(v)
          #   opts[k] = val
          # end

          opts_struct = Google::Protobuf::Struct.from_hash(
            opts.transform_keys(&:to_s)
          )

          SDK::FuncSpec::Args.new(
            args: [
              SDK::FuncSpec::Value.new(
                name: "", 
                type: "hashicorp.vagrant.sdk.Args.Target.Machine", 
                value: Google::Protobuf::Any.pack(machine.to_proto)
              ),
              SDK::FuncSpec::Value.new(
                type: "hashicorp.vagrant.sdk.Communicator.Command",
                value: Google::Protobuf::Any.pack(SDK::Communicator::Command.new(command: cmd)),
              ),
              SDK::FuncSpec::Value.new(
                type: "google.protobuf.Struct",
                value: Google::Protobuf::Any.pack(opts_struct),
              ),
            ]
          )
        end
      end
    end
  end
end
