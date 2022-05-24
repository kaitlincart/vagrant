# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: vagrant_plugin_sdk/plugin.proto for package 'hashicorp.vagrant.sdk'

require 'grpc'
require 'vagrant_plugin_sdk/plugin_pb'

module Hashicorp
  module Vagrant
    module Sdk
      module TerminalUIService
        # *******************************************************************
        # Terminal UI Service
        # ******************************************************************
        #
        # TerminalUIService is a service that provides "sdk/terminal.UI" interface
        # to plugins. Plugins don't interact with this directly, they usually
        # interact with it indirectly via a terminal.UI implementation.
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.TerminalUIService'

          rpc :Output, ::Hashicorp::Vagrant::Sdk::TerminalUI::OutputRequest, ::Google::Protobuf::Empty
          rpc :Events, stream(::Hashicorp::Vagrant::Sdk::TerminalUI::Event), stream(::Hashicorp::Vagrant::Sdk::TerminalUI::Response)
          rpc :IsInteractive, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::TerminalUI::IsInteractiveResponse
          rpc :IsMachineReadable, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::TerminalUI::IsMachineReadableResponse
        end

        Stub = Service.rpc_stub_class
      end
      module Mapper
        # Mapper is a specialized type of plugin that provides type mappers
        # to convert to/from various types.
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.Mapper'

          # ListMappers returns the list of mappers that this plugin supports.
          rpc :ListMappers, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Map::ListResponse
          # Map executes a mapper.
          rpc :Map, ::Hashicorp::Vagrant::Sdk::Map::Request, ::Hashicorp::Vagrant::Sdk::Map::Response
        end

        Stub = Service.rpc_stub_class
      end
      module StateBagService
        # *
        # Core plugin services
        #
        # Core State Bag //
        #
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.StateBagService'

          rpc :Get, ::Hashicorp::Vagrant::Sdk::StateBag::GetRequest, ::Hashicorp::Vagrant::Sdk::StateBag::GetResponse
          rpc :GetOk, ::Hashicorp::Vagrant::Sdk::StateBag::GetRequest, ::Hashicorp::Vagrant::Sdk::StateBag::GetOkResponse
          rpc :Put, ::Hashicorp::Vagrant::Sdk::StateBag::PutRequest, ::Hashicorp::Vagrant::Sdk::StateBag::PutResponse
          rpc :Remove, ::Hashicorp::Vagrant::Sdk::StateBag::RemoveRequest, ::Hashicorp::Vagrant::Sdk::StateBag::RemoveResponse
        end

        Stub = Service.rpc_stub_class
      end
      module PluginInfoService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.PluginInfoService'

          rpc :ComponentTypes, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::ComponentList
          rpc :ComponentOptions, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::ComponentOptionsMap
          rpc :Name, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module PluginManagerService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.PluginManagerService'

          rpc :ListPlugins, ::Hashicorp::Vagrant::Sdk::PluginManager::PluginsRequest, ::Hashicorp::Vagrant::Sdk::PluginManager::PluginsResponse
          rpc :GetPlugin, ::Hashicorp::Vagrant::Sdk::PluginManager::Plugin, ::Hashicorp::Vagrant::Sdk::PluginManager::Plugin
        end

        Stub = Service.rpc_stub_class
      end
      module CorePluginManagerService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.CorePluginManagerService'

          rpc :GetPlugin, ::Hashicorp::Vagrant::Sdk::CorePluginManager::GetPluginRequest, ::Hashicorp::Vagrant::Sdk::CorePluginManager::GetPluginResponse
        end

        Stub = Service.rpc_stub_class
      end
      module ProviderService
        # *******************************************************************
        # Provider Plugin Service
        # ******************************************************************
        #
        # Provider service is a provider that takes some set of arguments changes
        # the state of a machine
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.ProviderService'

          rpc :Usable, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Provider::UsableResp
          rpc :UsableSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Installed, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Provider::InstalledResp
          rpc :InstalledSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Action, ::Hashicorp::Vagrant::Sdk::Provider::ActionRequest, ::Google::Protobuf::Empty
          rpc :ActionSpec, ::Hashicorp::Vagrant::Sdk::Provider::ActionRequest, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :MachineIdChanged, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :MachineIdChangedSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :SshInfo, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Args::Connection::SSHInfo
          rpc :SshInfoSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :State, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Args::Target::Machine::State
          rpc :StateSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :Capability, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::Platform::Capability::Resp
          rpc :CapabilitySpec, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :HasCapability, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::Capability::CheckResp
          rpc :HasCapabilitySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module ProvisionerService
        # *******************************************************************
        # Provisioner Plugin Service
        # ******************************************************************
        #
        # A Provisioner runs actions against a VM
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.ProvisionerService'

          rpc :ConfigureSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :ProvisionSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Provision, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :CleanupSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Cleanup, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module CommandService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.CommandService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :ExecuteSpec, ::Hashicorp::Vagrant::Sdk::Command::ExecuteSpecReq, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Execute, ::Hashicorp::Vagrant::Sdk::Command::ExecuteReq, ::Hashicorp::Vagrant::Sdk::Command::ExecuteResp
          rpc :CommandInfoSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :CommandInfo, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Command::CommandInfoResp
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module CommunicatorService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.CommunicatorService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :MatchSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Match, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::MatchResp
          rpc :InitSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Init, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :ReadySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Ready, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::ReadyResp
          rpc :WaitForReadySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :WaitForReady, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::ReadyResp
          rpc :DownloadSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Download, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :UploadSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Upload, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :ExecuteSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Execute, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::ExecuteResp
          rpc :PrivilegedExecuteSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :PrivilegedExecute, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::ExecuteResp
          rpc :TestSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Test, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Communicator::TestResp
          rpc :ResetSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Reset, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module ConfigService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.ConfigService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
        end

        Stub = Service.rpc_stub_class
      end
      module HostService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.HostService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :Detect, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::DetectResp
          rpc :DetectSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Capability, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::Platform::Capability::Resp
          rpc :CapabilitySpec, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :HasCapability, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::Capability::CheckResp
          rpc :HasCapabilitySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Parent, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::ParentResp
          rpc :ParentSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module GuestService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.GuestService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :Detect, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::DetectResp
          rpc :DetectSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Capability, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::Platform::Capability::Resp
          rpc :CapabilitySpec, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :HasCapability, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::Capability::CheckResp
          rpc :HasCapabilitySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Parent, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::ParentResp
          rpc :ParentSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module SyncedFolderService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.SyncedFolderService'

          rpc :ConfigStruct, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::StructResp
          rpc :Configure, ::Hashicorp::Vagrant::Sdk::Config::ConfigureRequest, ::Google::Protobuf::Empty
          rpc :Documentation, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Config::Documentation
          rpc :Usable, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::SyncedFolder::UsableResp
          rpc :UsableSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Enable, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :EnableSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Prepare, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :PrepareSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Disable, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :DisableSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Cleanup, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :CleanupSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Capability, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::Platform::Capability::Resp
          rpc :CapabilitySpec, ::Hashicorp::Vagrant::Sdk::Platform::Capability::NamedRequest, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :HasCapability, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Hashicorp::Vagrant::Sdk::Platform::Capability::CheckResp
          rpc :HasCapabilitySpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module BasisService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.BasisService'

          rpc :CWD, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :DataDir, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::DataDir::Basis
          rpc :DefaultPrivateKey, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :UI, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TerminalUI
          rpc :Host, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Host
          rpc :Boxes, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::BoxCollection
          rpc :TargetIndex, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TargetIndex
          rpc :ResourceId, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Basis::ResourceIdResponse
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
        end

        Stub = Service.rpc_stub_class
      end
      module TargetService
        # *******************************************************************
        # Target services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.TargetService'

          rpc :ResourceId, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::ResourceIdResponse
          rpc :Record, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::RecordResponse
          rpc :Name, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::NameResponse
          rpc :SetName, ::Hashicorp::Vagrant::Sdk::Target::SetNameRequest, ::Google::Protobuf::Empty
          rpc :Project, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Project
          rpc :Metadata, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::MetadataSet
          rpc :DataDir, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::DataDir::Target
          rpc :State, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Target::State
          rpc :UI, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TerminalUI
          rpc :Specialize, ::Google::Protobuf::Any, ::Google::Protobuf::Any
          rpc :Provider, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Provider
          rpc :ProviderName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::NameResponse
          rpc :UpdatedAt, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::UpdatedAtResponse
          rpc :Communicate, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Communicator
          rpc :Save, ::Google::Protobuf::Empty, ::Google::Protobuf::Empty
          rpc :SetUUID, ::Hashicorp::Vagrant::Sdk::Target::SetUUIDRequest, ::Google::Protobuf::Empty
          rpc :GetUUID, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::GetUUIDResponse
          rpc :Destroy, ::Google::Protobuf::Empty, ::Google::Protobuf::Empty
        end

        Stub = Service.rpc_stub_class
      end
      module TargetMachineService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.TargetMachineService'

          # Required so a machine can properly act as a target
          rpc :ResourceId, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::ResourceIdResponse
          rpc :Record, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::RecordResponse
          rpc :Name, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::NameResponse
          rpc :SetName, ::Hashicorp::Vagrant::Sdk::Target::SetNameRequest, ::Google::Protobuf::Empty
          rpc :Project, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Project
          rpc :Metadata, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::MetadataSet
          rpc :DataDir, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::DataDir::Target
          rpc :State, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Target::State
          rpc :UI, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TerminalUI
          rpc :Specialize, ::Google::Protobuf::Any, ::Google::Protobuf::Any
          rpc :Provider, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Provider
          rpc :ProviderName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::NameResponse
          rpc :UpdatedAt, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::UpdatedAtResponse
          rpc :Communicate, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Communicator
          rpc :Save, ::Google::Protobuf::Empty, ::Google::Protobuf::Empty
          rpc :SetUUID, ::Hashicorp::Vagrant::Sdk::Target::SetUUIDRequest, ::Google::Protobuf::Empty
          rpc :GetUUID, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::GetUUIDResponse
          rpc :Destroy, ::Google::Protobuf::Empty, ::Google::Protobuf::Empty
          # Machine specific
          rpc :SetID, ::Hashicorp::Vagrant::Sdk::Target::Machine::SetIDRequest, ::Google::Protobuf::Empty
          rpc :GetID, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::Machine::GetIDResponse
          rpc :SetState, ::Hashicorp::Vagrant::Sdk::Target::Machine::SetStateRequest, ::Google::Protobuf::Empty
          rpc :GetState, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Target::Machine::State
          rpc :Box, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Box
          rpc :Guest, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Guest
          rpc :ConnectionInfo, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::Machine::ConnectionInfoResponse
          rpc :UID, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::Machine::UIDResponse
          rpc :SyncedFolders, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Target::Machine::SyncedFoldersResponse
        end

        Stub = Service.rpc_stub_class
      end
      module ProjectService
        # *******************************************************************
        # Project services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.ProjectService'

          rpc :ActiveTargets, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::ActiveTargetsResponse
          rpc :Boxes, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::BoxCollection
          rpc :Config, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::ConfigResponse
          rpc :CWD, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :DataDir, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::DataDir::Project
          rpc :DefaultPrivateKey, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :DefaultProvider, ::Hashicorp::Vagrant::Sdk::Project::DefaultProviderRequest, ::Hashicorp::Vagrant::Sdk::Project::DefaultProviderResponse
          rpc :Home, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :Host, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Host
          rpc :LocalData, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :PrimaryTargetName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::PrimaryTargetNameResponse
          rpc :ResourceId, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::ResourceIdResponse
          rpc :RootPath, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :Target, ::Hashicorp::Vagrant::Sdk::Project::TargetRequest, ::Hashicorp::Vagrant::Sdk::Args::Target
          rpc :TargetIds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::TargetIdsResponse
          rpc :TargetIndex, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TargetIndex
          rpc :TargetNames, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::TargetNamesResponse
          rpc :Tmp, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :UI, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::TerminalUI
          rpc :VagrantfileName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Project::VagrantfileNameResponse
          rpc :VagrantfilePath, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
        end

        Stub = Service.rpc_stub_class
      end
      module VagrantfileService
        # *******************************************************************
        # Vagrantfile services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.VagrantfileService'

          rpc :GetVagrantfile, ::Hashicorp::Vagrant::Sdk::Vagrantfile::GetVagrantfileRequest, ::Hashicorp::Vagrant::Sdk::Vagrantfile::GetVagrantfileResponse
          rpc :Target, ::Hashicorp::Vagrant::Sdk::Vagrantfile::TargetRequest, ::Hashicorp::Vagrant::Sdk::Vagrantfile::TargetResponse
          rpc :TargetConfig, ::Hashicorp::Vagrant::Sdk::Vagrantfile::TargetConfigRequest, ::Hashicorp::Vagrant::Sdk::Vagrantfile::TargetConfigResponse
          rpc :TargetNames, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Vagrantfile::TargetNamesResponse
          rpc :PrimaryTargetName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Vagrantfile::PrimaryTargetNameResponse
        end

        Stub = Service.rpc_stub_class
      end
      module TargetIndexService
        # *******************************************************************
        # TargetIndex services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.TargetIndexService'

          rpc :Delete, ::Hashicorp::Vagrant::Sdk::TargetIndex::TargetIdentifier, ::Google::Protobuf::Empty
          rpc :Get, ::Hashicorp::Vagrant::Sdk::TargetIndex::TargetIdentifier, ::Hashicorp::Vagrant::Sdk::Args::Target
          rpc :Includes, ::Hashicorp::Vagrant::Sdk::TargetIndex::TargetIdentifier, ::Hashicorp::Vagrant::Sdk::TargetIndex::IncludesResponse
          rpc :Set, ::Hashicorp::Vagrant::Sdk::Args::Target, ::Hashicorp::Vagrant::Sdk::Args::Target
          rpc :All, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::TargetIndex::AllResponse
        end

        Stub = Service.rpc_stub_class
      end
      module BoxService
        # *******************************************************************
        # Box services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.BoxService'

          rpc :AutomaticUpdateCheckAllowed, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::AutomaticUpdateCheckAllowedResponse
          rpc :Destroy, ::Google::Protobuf::Empty, ::Google::Protobuf::Empty
          rpc :HasUpdate, ::Hashicorp::Vagrant::Sdk::Box::HasUpdateRequest, ::Hashicorp::Vagrant::Sdk::Box::HasUpdateResponse
          rpc :UpdateInfo, ::Hashicorp::Vagrant::Sdk::Box::HasUpdateRequest, ::Hashicorp::Vagrant::Sdk::Box::UpdateInfoResponse
          rpc :InUse, ::Hashicorp::Vagrant::Sdk::Args::TargetIndex, ::Hashicorp::Vagrant::Sdk::Box::InUseResponse
          rpc :Machines, ::Hashicorp::Vagrant::Sdk::Args::TargetIndex, ::Hashicorp::Vagrant::Sdk::Box::MachinesResponse
          rpc :Repackage, ::Hashicorp::Vagrant::Sdk::Args::Path, ::Google::Protobuf::Empty
          rpc :Directory, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Path
          rpc :Metadata, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::BoxMetadata
          rpc :BoxMetadata, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::BoxMetadataResponse
          rpc :MetadataURL, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::MetadataUrlResponse
          rpc :Name, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::NameResponse
          rpc :Provider, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::ProviderResponse
          rpc :Version, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Box::VersionResponse
          rpc :Compare, ::Hashicorp::Vagrant::Sdk::Args::Box, ::Hashicorp::Vagrant::Sdk::Box::EqualityResponse
        end

        Stub = Service.rpc_stub_class
      end
      module BoxCollectionService
        # *******************************************************************
        # BoxCollecion services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.BoxCollectionService'

          rpc :Add, ::Hashicorp::Vagrant::Sdk::BoxCollection::AddRequest, ::Hashicorp::Vagrant::Sdk::Args::Box
          rpc :All, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::BoxCollection::AllResponse
          rpc :Clean, ::Hashicorp::Vagrant::Sdk::BoxCollection::CleanRequest, ::Google::Protobuf::Empty
          rpc :Find, ::Hashicorp::Vagrant::Sdk::BoxCollection::FindRequest, ::Hashicorp::Vagrant::Sdk::Args::Box
        end

        Stub = Service.rpc_stub_class
      end
      module BoxMetadataService
        # *******************************************************************
        # BoxMetadata services
        # ******************************************************************
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.BoxMetadataService'

          rpc :BoxName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::BoxMetadata::NameResponse
          rpc :LoadMetadata, ::Hashicorp::Vagrant::Sdk::BoxMetadata::LoadMetadataRequest, ::Google::Protobuf::Empty
          rpc :Version, ::Hashicorp::Vagrant::Sdk::BoxMetadata::VersionQuery, ::Hashicorp::Vagrant::Sdk::BoxMetadata::VersionResponse
          rpc :ListVersions, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ListVersionsQuery, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ListVersionsResponse
          rpc :Provider, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ProviderRequest, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ProviderResponse
          rpc :ListProviders, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ListProvidersRequest, ::Hashicorp::Vagrant::Sdk::BoxMetadata::ListProvidersResponse
        end

        Stub = Service.rpc_stub_class
      end
      module PushService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.PushService'

          rpc :PushSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Push, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
      module DownloaderService
        class Service

          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = 'hashicorp.vagrant.sdk.DownloaderService'

          rpc :DownloadSpec, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::FuncSpec
          rpc :Download, ::Hashicorp::Vagrant::Sdk::FuncSpec::Args, ::Google::Protobuf::Empty
          rpc :Seed, ::Hashicorp::Vagrant::Sdk::Args::Seeds, ::Google::Protobuf::Empty
          rpc :Seeds, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::Args::Seeds
          rpc :SetPluginName, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name, ::Google::Protobuf::Empty
          rpc :PluginName, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::Sdk::PluginInfo::Name
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
