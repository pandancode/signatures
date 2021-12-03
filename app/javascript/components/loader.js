const loader = () => {
 const signBtn = document.querySelector(".sign-contract");
 const loader = document.querySelector(".loader-container");
 const windowHeight = window.screen.availHeight;

 signBtn.addEventListener("click", ()=> {
    loader.style.display = "flex";
    loader.style.height = windowHeight + "px";
 })


}

export {loader}
