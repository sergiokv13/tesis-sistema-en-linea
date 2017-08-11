(function() {
  App.refrescar = App.cable.subscriptions.create("RefrescarChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      if (true) {
        return location.reload();
      }
    }
  });

}).call(this);

