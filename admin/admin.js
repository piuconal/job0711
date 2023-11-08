const links = ["l1", "l2", "l3", "l4", "l5"];

for (let i = 0; i < links.length; i++) {
  const link = document.getElementById(links[i]);
  link.addEventListener("click", function () {
    const page = "admin" + (i + 1) + ".html";
    window.location.href = page;
  });
}