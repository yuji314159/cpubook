`timescale 1ms/1us

module top_test;
  // クロック生成器 (100 Hz)
  logic pin_clock;
  initial pin_clock = 1'b0;
  always #5 pin_clock = ~pin_clock;

  // リセットボタン
  logic pin_n_reset;
  initial begin
    // 開始から2sボタンを押し続ける
    pin_n_reset = 1'b0;
    #2_000
    pin_n_reset = 1'b1;
  end

  // LEDモジュール
  logic pin_led;

  // topモジュール
  top top(.pin_clock, .pin_n_reset, .pin_led);
  defparam top.prescaler.RATIO = 100;
  initial top.prescaler.counter = 32'd0;
  initial top.prescaler.slow_clock = 1'b0;

  // 電圧ファイルの出力設定
  initial begin
    $dumpfile("top_test.vcd");
    $dumpvars(0, top_test);
  end

  // シミュレーションの終了設定
  initial begin
    #60_000;
    $finish;
  end
endmodule
