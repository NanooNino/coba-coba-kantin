let productTable;
let currentFilterStatus = '';
let currentFilterCategory = '';

document.addEventListener('DOMContentLoaded', function () {
    productTable = initGlobalDatatable('#table_product', function () {
        return {
            filter_status: currentFilterStatus,
            filter_category: currentFilterCategory,
        };
    });

    // Trigger reload on each filter
    document.querySelectorAll('.table-filter').forEach(el => {
        el.addEventListener('change', function () {
            if (productTable) productTable.ajax.reload();
        });
    });
});

var image = document.getElementById('display_image');
var title = $('#title_modal').data('title').split('|');
$(function () {

    $('.hps_image').on('click', function () {
        // console.log('hapus');
        $('input[name=name_image]').val("");
    });

    $('#kt_modal_product').on('shown.bs.modal', function () {
        $('#select_id_category').select2({ dropdownParent: $('#form_product') });
        
    });

});

function ubah_data(element, id) {
    $('#req_stock').addClass('d-none');
    var foto = $(element).data('image');
    var form = document.getElementById('form_product');
    $('#title_modal').text(title[0]);
    form.setAttribute('action', BASE_URL + '/master/update_product');
    $.ajax({
        url: BASE_URL + 'setting/get_single/product',
        method: 'POST',
        data: { 
            id: id 
        },
        dataType: 'json',
        success: function (data) {
            image.style.backgroundImage = "url('" + foto + "')";
            document.getElementById("product_file").value = "";
            $('input[name="id_product"]').val(data.id_product);
            $('select[name="id_category"]').val(data.id_category);
            $('select[name="id_category"]').trigger('change');
            $('input[name="title"]').val(data.title);
            $('input[name="name_image"]').val(data.image);
            $('input[name="price"]').val(data.price);
            $('#siuang').val(format_uang(data.price.toString()));
        }
    })
}


function tambah_stock(element, id) {
    var title = $(element).data('name');
    $('#display_product_name').text(title);
    $.ajax({
        url: BASE_URL + 'master/get_stock',
        method: 'POST',
        data: { 
            id: id 
        },
        dataType: 'json',
        success: function (data) {
            $('input[name="id_product"]').val(id);
            $('#display_list_stock').html(data.table);
        }
    })
}

function tambah_data() {
    var form = document.getElementById('form_product');
    form.setAttribute('action', BASE_URL + '/master/insert_product');
    $('#title_modal').text(title[1]);
    image.style.backgroundImage = "url('" + base_foto + "')";
    $('#form_product input[type="text"]').val('');
    $('#form_product select').val('');
    $('#form_product select').trigger('change');
    document.getElementById("product_file").value = "";
    $('#siuang').val('');
    $('#real_value').val('');
    $('#req_stock').removeClass('d-none');
}

function get_category(element, callback = null) {
    var value = $(element).val();
    $.ajax({
        url: BASE_URL + '/master/manager/categories',
        method: 'POST',
        data: { 
            _token : csrf_token,
            id: value 
        },
        cache : false,
        success: function (msg) {
            $('#select_id_category').html(msg);
            $('#select_id_category').trigger('change');

            // Jalankan callback kalau ada
            if (typeof callback === 'function') {
                callback();
            }
        }
    });
}


function filter_apply(){
    currentFilterStatus = $('#filter_status').val();
    currentFilterCategory = $('#filter_category').val();
    if (productTable) {
        productTable.ajax.reload();
    }
}

function set_filter_category(element) {
    var value = $(element).val();
    $.ajax({
        url: BASE_URL + '/master/manager/categories',
        method: 'POST',
        data: { 
            _token : csrf_token,
            id: value,
            all : true
        },
        cache : false,
        success: function (msg) {
            $('#filter_category').html(msg);
            $('#filter_category').trigger('change');
        }
    });
}
