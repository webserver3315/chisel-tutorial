;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit VendingMachineSwitch : 
  module VendingMachineSwitch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip nickel : UInt<1>, flip dime : UInt<1>, valid : UInt<1>}
    
    reg state : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[VendingMachineSwitch.scala 22:22]
    node _T = eq(UInt<3>("h00"), state) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.nickel : @[VendingMachineSwitch.scala 26:24]
        state <= UInt<3>("h01") @[VendingMachineSwitch.scala 26:32]
        skip @[VendingMachineSwitch.scala 26:24]
      when io.dime : @[VendingMachineSwitch.scala 27:22]
        state <= UInt<3>("h02") @[VendingMachineSwitch.scala 27:30]
        skip @[VendingMachineSwitch.scala 27:22]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<3>("h01"), state) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        when io.nickel : @[VendingMachineSwitch.scala 31:22]
          state <= UInt<3>("h02") @[VendingMachineSwitch.scala 31:30]
          skip @[VendingMachineSwitch.scala 31:22]
        when io.dime : @[VendingMachineSwitch.scala 32:20]
          state <= UInt<3>("h03") @[VendingMachineSwitch.scala 32:28]
          skip @[VendingMachineSwitch.scala 32:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<3>("h02"), state) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          when io.nickel : @[VendingMachineSwitch.scala 35:22]
            state <= UInt<3>("h03") @[VendingMachineSwitch.scala 35:30]
            skip @[VendingMachineSwitch.scala 35:22]
          when io.dime : @[VendingMachineSwitch.scala 36:20]
            state <= UInt<3>("h04") @[VendingMachineSwitch.scala 36:28]
            skip @[VendingMachineSwitch.scala 36:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_3 = eq(UInt<3>("h03"), state) @[Conditional.scala 37:30]
          when _T_3 : @[Conditional.scala 39:67]
            when io.nickel : @[VendingMachineSwitch.scala 39:22]
              state <= UInt<3>("h04") @[VendingMachineSwitch.scala 39:30]
              skip @[VendingMachineSwitch.scala 39:22]
            when io.dime : @[VendingMachineSwitch.scala 40:20]
              state <= UInt<3>("h04") @[VendingMachineSwitch.scala 40:28]
              skip @[VendingMachineSwitch.scala 40:20]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_4 = eq(UInt<3>("h04"), state) @[Conditional.scala 37:30]
            when _T_4 : @[Conditional.scala 39:67]
              state <= UInt<3>("h00") @[VendingMachineSwitch.scala 43:13]
              skip @[Conditional.scala 39:67]
    node _T_5 = eq(state, UInt<3>("h04")) @[VendingMachineSwitch.scala 47:22]
    io.valid <= _T_5 @[VendingMachineSwitch.scala 47:12]
    
