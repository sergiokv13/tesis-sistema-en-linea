(function() {
  App.refrescar = App.cable.subscriptions.create("RefrescarChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      if (data.id === $("#user_id").val()) {
        return location.reload();
      }
    }
  });

}).call(this);

