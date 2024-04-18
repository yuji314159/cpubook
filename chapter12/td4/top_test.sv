`timescale 1ns/1ps

module top_test;
  // クロック生成器 (100 MHz)
  logic pin_clock;
  initial pin_clock = 1'b0;
  always #5 pin_clock = ~pin_clock;

  // リセットボタン
  logic pin_n_reset;
  initial begin
    // 開始から10nsボタンを押し続ける
    pin_n_reset = 1'b0;
    #10
    pin_n_reset = 1'b1;
  end

  // スイッチ
  logic [3:0] pin_switch;
  initial begin
    pin_switch = 4'd6;
  end

  // LED
  logic [3:0] pin_led;

  // topモジュール
  top top(.pin_clock, .pin_n_reset, .pin_switch, .pin_led);
  defparam top.prescaler.RATIO = 2;
  initial top.prescaler.counter = 32'd0;
  initial top.prescaler.slow_clock = 1'b0;

  // 電圧ファイルの出力設定
  initial begin
    $dumpfile("top_test.vcd");
    $dumpvars(0, top_test);
  end

  // シミュレーションの終了設定
  initial begin
    #3000;
    $finish;
  end
endmodule
