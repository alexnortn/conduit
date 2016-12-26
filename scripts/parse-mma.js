// Alex Norton 2106
// Scripts for scraping town names from MMA --> Massachusetts Municiple Association

// Usage:
// 		Go to: https://www.mma.org/city-and-town-web-sites
// 		Open console, paste following code
// 		use copy(paths) to copy content to clipboard



var panels = document.getElementById("slider").getElementsByClassName("panel")
var paths = [];

for (var i=0; i < panels.length; i++) {
	var links = panels[i].getElementsByClassName("linkRow");
	for (var j = 0; j < links.length; j++) {
		var townName = links[j].getElementsByClassName("comName")[0];
		var url = 	   links[j].getElementsByClassName("comLink")[0];
		if (url.getElementsByTagName("a").length) { 

			paths.push(
				{
					townName: townName.textContent,
					url:      url.getElementsByTagName("a")[0].getAttribute("href")
				}
			)

		}
	}
}