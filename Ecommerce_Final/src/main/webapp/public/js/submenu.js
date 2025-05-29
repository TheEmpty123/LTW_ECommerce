// const menus = document.querySelectorAll('.text-menu');
// menus.forEach(subMenu => {
//     subMenu.addEventListener('click', () => {
//         menus.forEach(e => {
//             e.classList.remove('clicked')
//         });
//         subMenu.classList.add('clicked');
//     });
// });
const dots = document.querySelectorAll('.nav-box');

const idContent = ['information', 'order', 'product-viewed', 'wish-list', 'log-out'];
const idSubMenu = ['sub-menu-info', 'sub-menu-order', 'sub-menu-product-viewed', 'sub-menu-wish-list', 'sub-menu-logout'];
for (let i = 0; i < idSubMenu.length; i++) {
    const chooseSubMenu = document.getElementById(idSubMenu[i]);
    const chooseContent = idContent[i] ? document.getElementById(idContent[i]) : null;
    if (!chooseSubMenu) continue; //Bỏ qua nếu submenu null
    chooseSubMenu.addEventListener('click', () => {
        console.log("Sub menu "+ i)
        for (let j = 0; j < idSubMenu.length; j++) {
            const subMenu = document.getElementById(idSubMenu[j]);
            const content = idContent[j] ? document.getElementById(idContent[j]) : null;

            if (subMenu) subMenu.classList.remove('clicked');
            if (content) {
                content.classList.remove('show');
                content.classList.add('hidden');
            }
        }
        chooseSubMenu.classList.add('clicked');
        if (chooseContent) {
            chooseContent.classList.remove('hidden');
            chooseContent.classList.add('show');
        }
        if(i === 1){
            const firstChild = document.getElementById('first-child')
            dots.forEach(e => {
                e.classList.remove('clicked')
                if (e.classList.contains('fchild')) {
                    e.classList.remove('fchild')
                }
            });
            firstChild.classList.add('clicked');
        }

    });
}


//Xử lí sự kiện thanh navigation cho phần sản phẩm vừa xem
dots.forEach(dot => {
    dot.addEventListener('click', () => {
        dots.forEach(e => {
            e.classList.remove('clicked')
            if (e.classList.contains('fchild')) {
                e.classList.remove('fchild')
            }
        });
        dot.classList.add('clicked');
    });
});