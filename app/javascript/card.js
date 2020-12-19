const pay = () => {
  Payjp.setPublicKey("pk_test_93cf417a12f2c5afabd8f8ba"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
    });
  });
};

window.addEventListener("load", pay);

//テストカード
//4242424242424242
//123

//l20-23:HTMLのinput要素にトークンの値を埋め込み、フォームに追加
//トークン：tok_93fb27d8437179588a79edf75a9c