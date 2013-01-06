(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  App = (function() {

    function App() {
      this.go = __bind(this.go, this);      this.canvas = $("canvas");
      this.ctx = this.canvas[0].getContext('2d');
      this.ctx.fillCircle = function(x, y, r) {
        this.beginPath();
        this.arc(x, y, r, 0, Math.PI * 2, false);
        this.closePath();
        return this.fill();
      };
      this.width = 3508;
      this.height = 4961;
      this.amount = this.roundom(100);
      this.canvas[0].width = this.width;
      this.canvas[0].height = this.height;
      this.ctx.fillStyle = '#ededde';
      this.ctx.fillRect(0, 0, this.width, this.height);
      $("#go").click(this.go);
    }

    App.prototype.roundom = function(int) {
      return Math.ceil(Math.random() * int);
    };

    App.prototype.go = function() {
      var num, _ref;
      for (num = 1, _ref = this.amount; 1 <= _ref ? num <= _ref : num >= _ref; 1 <= _ref ? num++ : num--) {
        this.ctx.fillStyle = "rgba(200,175,165," + (Math.random()) + ")";
        this.ctx.fillCircle(this.roundom(this.width), this.roundom(this.height), this.roundom(this.width / 8));
      }
      $("body").append("<a href='" + this.canvas[0].toDataURL() + "' target='_blank'> A2 -> download</a>");
      return false;
    };

    return App;

  })();

  $(function() {
    return window.app = new App;
  });

}).call(this);
