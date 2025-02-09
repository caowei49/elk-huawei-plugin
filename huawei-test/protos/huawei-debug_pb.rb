# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: huawei-debug.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
    add_message "huawei_debug.Debug" do
      optional :cpu_infos, :message, 1, "huawei_debug.Debug.CpuInfos"
      optional :service_cpu_infos, :message, 2, "huawei_debug.Debug.ServiceCpuInfos"
      optional :memory_infos, :message, 3, "huawei_debug.Debug.MemoryInfos"
      optional :resouce_reliability, :message, 4, "huawei_debug.Debug.ResouceReliability"
      optional :board_resouce_states, :message, 5, "huawei_debug.Debug.BoardResouceStates"
      optional :disk, :message, 6, "huawei_debug.Debug.Disk"
    end
    add_message "huawei_debug.Debug.CpuInfos" do
      repeated :cpu_info, :message, 1, "huawei_debug.Debug.CpuInfos.CpuInfo"
    end
    add_message "huawei_debug.Debug.CpuInfos.CpuInfo" do
      optional :position, :string, 1
      optional :overload_threshold, :uint32, 2
      optional :unoverload_threshold, :uint32, 3
      optional :interval, :uint32, 4
      optional :index, :uint32, 5
      optional :system_cpu_usage, :uint32, 6
      optional :monitor_number, :uint32, 7
      optional :monitor_cycle, :uint32, 8
      optional :overload_state_change_time, :string, 9
      optional :current_overload_state, :string, 10
    end
    add_message "huawei_debug.Debug.ServiceCpuInfos" do
      repeated :service_cpu_info, :message, 1, "huawei_debug.Debug.ServiceCpuInfos.ServiceCpuInfo"
    end
    add_message "huawei_debug.Debug.ServiceCpuInfos.ServiceCpuInfo" do
      optional :position, :string, 1
      optional :service_name, :string, 2
      optional :service_cpu_usage, :uint32, 3
    end
    add_message "huawei_debug.Debug.MemoryInfos" do
      repeated :memory_info, :message, 1, "huawei_debug.Debug.MemoryInfos.MemoryInfo"
    end
    add_message "huawei_debug.Debug.MemoryInfos.MemoryInfo" do
      optional :position, :string, 1
      optional :overload_threshold, :uint32, 2
      optional :unoverload_threshold, :uint32, 3
      optional :index, :uint32, 4
      optional :os_memory_total, :uint32, 5
      optional :os_memory_use, :uint32, 6
      optional :os_memory_free, :uint32, 7
      optional :os_memory_usage, :uint32, 8
      optional :do_memory_total, :uint32, 9
      optional :do_memory_use, :uint32, 10
      optional :do_memory_free, :uint32, 11
      optional :do_memory_usage, :uint32, 12
      optional :simple_memory_total, :uint32, 13
      optional :simple_memory_use, :uint32, 14
      optional :simple_memory_free, :uint32, 15
      optional :simple_memory_usage, :uint32, 16
      optional :overload_state_change_time, :string, 17
      optional :current_overload_state, :string, 18
      optional :memreli_notice_threshold, :uint32, 19
      optional :memreli_overload_threshold, :uint32, 20
      optional :memreli_exception_threshold, :uint32, 21
    end
    add_message "huawei_debug.Debug.ResouceReliability" do
      optional :memory_reliability, :message, 1, "huawei_debug.Debug.ResouceReliability.MemoryReliability"
      optional :memory_reliability_switchover_threshold, :message, 2, "huawei_debug.Debug.ResouceReliability.MemoryReliabilitySwitchoverThreshold"
      optional :flow_control_message_reliability, :message, 3, "huawei_debug.Debug.ResouceReliability.FlowControlMessageReliability"
    end
    add_message "huawei_debug.Debug.ResouceReliability.MemoryReliability" do
      optional :enable, :bool, 1
    end
    add_message "huawei_debug.Debug.ResouceReliability.MemoryReliabilitySwitchoverThreshold" do
      optional :threshold, :uint32, 1
    end
    add_message "huawei_debug.Debug.ResouceReliability.FlowControlMessageReliability" do
      optional :enable, :bool, 1
    end
    add_message "huawei_debug.Debug.BoardResouceStates" do
      repeated :board_resouce_state, :message, 1, "huawei_debug.Debug.BoardResouceStates.BoardResouceState"
    end
    add_message "huawei_debug.Debug.BoardResouceStates.BoardResouceState" do
      optional :position, :string, 1
      optional :entity_index, :uint32, 2
      optional :board_name, :string, 3
      optional :cpu_usage, :uint32, 4
      optional :memory_total_size, :uint32, 5
      optional :memory_used_size, :uint32, 6
      optional :memory_usage, :uint32, 7
    end
    add_message "huawei_debug.Debug.Disk" do
      optional :global, :message, 1, "huawei_debug.Debug.Disk.Global"
    end
    add_message "huawei_debug.Debug.Disk.Global" do
      optional :fault_detect_tolerance_time, :uint32, 1
    end
end

module HuaweiDebug
  Debug = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug").msgclass
  Debug::CpuInfos = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.CpuInfos").msgclass
  Debug::CpuInfos::CpuInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.CpuInfos.CpuInfo").msgclass
  Debug::ServiceCpuInfos = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ServiceCpuInfos").msgclass
  Debug::ServiceCpuInfos::ServiceCpuInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ServiceCpuInfos.ServiceCpuInfo").msgclass
  Debug::MemoryInfos = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.MemoryInfos").msgclass
  Debug::MemoryInfos::MemoryInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.MemoryInfos.MemoryInfo").msgclass
  Debug::ResouceReliability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ResouceReliability").msgclass
  Debug::ResouceReliability::MemoryReliability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ResouceReliability.MemoryReliability").msgclass
  Debug::ResouceReliability::MemoryReliabilitySwitchoverThreshold = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ResouceReliability.MemoryReliabilitySwitchoverThreshold").msgclass
  Debug::ResouceReliability::FlowControlMessageReliability = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.ResouceReliability.FlowControlMessageReliability").msgclass
  Debug::BoardResouceStates = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.BoardResouceStates").msgclass
  Debug::BoardResouceStates::BoardResouceState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.BoardResouceStates.BoardResouceState").msgclass
  Debug::Disk = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.Disk").msgclass
  Debug::Disk::Global = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("huawei_debug.Debug.Disk.Global").msgclass
end
