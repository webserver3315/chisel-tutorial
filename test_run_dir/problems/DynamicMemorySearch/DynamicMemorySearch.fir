;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit DynamicMemorySearch : 
  module DynamicMemorySearch : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip isWr : UInt<1>, flip wrAddr : UInt<3>, flip data : UInt<4>, flip en : UInt<1>, target : UInt<3>, done : UInt<1>}
    
    cmem list : UInt<4>[8] @[DynamicMemorySearch.scala 32:17]
    reg index : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[DynamicMemorySearch.scala 33:23]
    infer mport memVal = list[index], clock @[DynamicMemorySearch.scala 34:20]
    node _T = eq(io.en, UInt<1>("h00")) @[DynamicMemorySearch.scala 37:16]
    node _T_1 = eq(memVal, io.data) @[DynamicMemorySearch.scala 37:35]
    node _T_2 = eq(index, UInt<3>("h07")) @[DynamicMemorySearch.scala 37:58]
    node _T_3 = or(_T_1, _T_2) @[DynamicMemorySearch.scala 37:48]
    node done = and(_T, _T_3) @[DynamicMemorySearch.scala 37:23]
    when io.isWr : @[DynamicMemorySearch.scala 44:16]
      infer mport _T_4 = list[io.wrAddr], clock @[DynamicMemorySearch.scala 45:9]
      _T_4 <= io.data @[DynamicMemorySearch.scala 45:21]
      skip @[DynamicMemorySearch.scala 44:16]
    else : @[DynamicMemorySearch.scala 46:23]
      when io.en : @[DynamicMemorySearch.scala 46:23]
        index <= UInt<1>("h00") @[DynamicMemorySearch.scala 47:11]
        skip @[DynamicMemorySearch.scala 46:23]
      else : @[DynamicMemorySearch.scala 48:34]
        node _T_5 = eq(done, UInt<1>("h00")) @[DynamicMemorySearch.scala 48:21]
        when _T_5 : @[DynamicMemorySearch.scala 48:34]
          node _T_6 = add(index, UInt<1>("h01")) @[DynamicMemorySearch.scala 49:20]
          node _T_7 = tail(_T_6, 1) @[DynamicMemorySearch.scala 49:20]
          index <= _T_7 @[DynamicMemorySearch.scala 49:11]
          skip @[DynamicMemorySearch.scala 48:34]
        else : @[DynamicMemorySearch.scala 50:15]
          skip @[DynamicMemorySearch.scala 50:15]
    io.done <= done @[DynamicMemorySearch.scala 53:13]
    io.target <= index @[DynamicMemorySearch.scala 54:13]
    
