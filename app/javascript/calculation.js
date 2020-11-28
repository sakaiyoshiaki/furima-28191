// 販売価格が入力されたら、販売手数料と販売利益を計算する
$(function(){
  $( document ).on( 'keyup', '#item-price', function(){
  // 販売価格の入力欄に入力すると、入力値を取得し、HTML要素を書き換える
    let amount = $( this ).val();
    // 販売価格の入力欄に入力された値を変数「amount」に代入
    let tax = Math.ceil(amount * 0.1);
    // 販売手数料は10%。またMath.ceilメソッドで1円単位に切り上げ。
    // 計算結果を変数「tax」に代入
    let profit = Math.floor(amount * 0.9);
    // 利益は残りの金額。Math.floorメソッドで、1円単位で切り捨てておけば「販売価格 = 販売手数料 + 販売利益」が成り立つ。
    // 計算結果は変数「profit」に代入。
    $('#add-tax-price').html(tax);
    // htmlメソッドを使って、販売手数料の空欄をtaxの値に書き換え。
    $('#profit').html(profit);
    // htmlメソッドを使って、販売利益の空欄をprofitの値に書き換え。
  });
});