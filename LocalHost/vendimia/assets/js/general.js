function notification(titulo, texto, tipo) {
	new PNotify({
		title: titulo,
		text: texto,
		type: tipo,
		styling: 'fontawesome',
		delay: 4000
	});
}

function confirmation() {
	new PNotify({
		title: 'Mensaje De Confirmación',
		text: '¿Esta seguro de salir de la pantalla actual? Los datos no guardados se perderan.',
		styling: "jqueryui",
		icon: 'fa fa-warning',
		hide: false,
		confirm: {
			confirm: true
		},
		buttons: {
			closer: false,
			sticker: false
		},
		history: {
			history: false
		},
		addclass: 'stack-modal',
		stack: { 'dir1': 'down', 'dir2': 'right', 'modal': true }
	}).get().on('pnotify.confirm', function () {
		location.reload();
	}).on('pnotify.cancel', function () {

	});
}