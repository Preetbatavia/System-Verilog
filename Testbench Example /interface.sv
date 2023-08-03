// Interface allows the verification components to access the signals using a virtual interface.
interface data_if(input logic clk);
  logic  [3:0]data;
  logic  reset;
  logic  incr;
  logic  decr ;
  logic  error;
endinterface
