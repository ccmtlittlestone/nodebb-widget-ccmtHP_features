<div class="row">
  <div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">ccmtHP_features settings</div>
			<div class="panel-body">
				<form role="form" id="ccmtHP_features">
					<!-- <div class="form-group">
						<label for="opacity">ico1</label>
						<input type="text" id="ico1" data-key="ico1" title="ico1" class="form-control" placeholder="">
					</div>
          <div class="form-group">
						<label for="opacity">tit1</label>
						<input type="text" id="tit1" data-key="tit1" title="tit1" class="form-control" placeholder="">
					</div>
          <div class="form-group">
						<label for="opacity">url1</label>
						<input type="text" id="url1" data-key="url1" title="url1" class="form-control" placeholder="">
					</div> -->

          <table id="enabled">
            <th>
              <td>图标</td>
              <td>标题</td>
              <td>url</td>
            </th>
          	<tr>
          		<td>
                <td><input type="text" id="ico1" data-key="ico1" title="ico1" class="form-control"></td>
          		</td>
          		<td><input type="text" id="tit1" data-key="tit1" title="tit1" class="form-control"></td>
          		<td><input type="text" id="url1" data-key="url1" title="url1" class="form-control"></td>
          	</tr>
          	<tr>
          		<td>
                <td><input type="text" id="ico2" data-key="ico2" title="ico2" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit2" data-key="tit2" title="tit2" class="form-control"></td>
          		<td><input type="text" id="url2" data-key="url2" title="url2" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico3" data-key="ico3" title="ico3" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit3" data-key="tit3" title="tit3" class="form-control"></td>
          		<td><input type="text" id="url3" data-key="url3" title="url3" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico4" data-key="ico4" title="ico4" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit4" data-key="tit4" title="tit4" class="form-control"></td>
          		<td><input type="text" id="url4" data-key="url4" title="url4" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico5" data-key="ico5" title="ico5" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit5" data-key="tit5" title="tit5" class="form-control"></td>
          		<td><input type="text" id="url5" data-key="url5" title="url5" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico6" data-key="ico6" title="ico6" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit6" data-key="tit6" title="tit6" class="form-control"></td>
          		<td><input type="text" id="url6" data-key="url6" title="url6" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico7" data-key="ico7" title="ico7" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit7" data-key="tit7" title="tit7" class="form-control"></td>
          		<td><input type="text" id="url7" data-key="url7" title="url7" class="form-control"></td>
          	</tr>

            <tr>
          		<td>
                <td><input type="text" id="ico8" data-key="ico8" title="ico8" class="form-control"></td>
          		</td>
              <td><input type="text" id="tit8" data-key="tit8" title="tit8" class="form-control"></td>
          		<td><input type="text" id="url8" data-key="url8" title="url8" class="form-control"></td>
          	</tr>

          </table>

				</form>
			</div>
		</div>
	</div>
  <div class="col-lg-3">
    <p>这里是所选的图标，请将图标名称填到上面图标栏</p>
    <div class="show_icon">
      <i class="fa fa-3x fa-camera-retro"></i>
      <br>
      <p class="show_class"></p>
    </div>
  </div>
  <div class="col-lg-3">
    <div class="panel panel-default">
      <div class="panel-heading">Control Panel</div>
      <div class="panel-body">
        <button class="btn btn-primary" id="save">Save Settings</button>
      </div>
    </div>
  </div>
</div>
<!-- IMPORT partials/fontawesome.tpl -->

<script>
require(['settings'], function(settings) {

	settings.sync('ccmtHP_features', $('#ccmtHP_features'));

	$('#save').click( function (event) {
		settings.persist('ccmtHP_features', $('#ccmtHP_features'), function(){
			socket.emit('admin.settings.syncCcmtHP_features');
			app.alertSuccess('Please restart your forum for changes to fully take effect.');
		});
    // socket.emit('admin.settings.syncccmtHP_features');
	});
});

$('.fa-icons i').click(function(){
  // alert(this.className)
  var className=this.className;
  $('.show_icon i').removeClass().addClass(className+' fa-3x');
  $('.show_icon .show_class').text(className)

})
</script>
