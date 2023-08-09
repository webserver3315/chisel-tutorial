circuit Hello :
  module Hello :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<8>
  
    io_out <= UInt<6>("h2a") @[Hello.scala 11:10]
