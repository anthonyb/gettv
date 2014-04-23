// http://stackoverflow.com/questions/20461485/ios-disable-bounce-scroll-but-allow-normal-scrolling
// http://stackoverflow.com/questions/7798201/document-ontouchmove-and-scrolling-on-ios-5/16898264#16898264

var content = document;
content.addEventListener('touchstart', function(event){
    this.allowUp = (this.scrollTop > 0);
    this.allowDown = (this.scrollTop < this.scrollHeight - this.clientHeight);
    this.slideBeginY = event.pageY;
});

content.addEventListener('touchmove', function(event){
    var up = (event.pageY > this.slideBeginY);
    var down = (event.pageY < this.slideBeginY)
    this.slideBeginY = event.pageY;
    if ((up && this.allowUp) || (down && this.allowDown))
        event.stopPropagation();
    else
        event.preventDefault();
    });