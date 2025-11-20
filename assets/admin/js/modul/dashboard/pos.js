function trx_product(element) {
    var value = element.value;
    var stock = $(element).data('stock');
    var image = $(element).data('image');
    var title = $(element).data('title');
    var price = $(element).data('price');
    if (stock <= 0) {
        show_alert('warning','<b>'+title+'</b> tidak memiliki cukup stok');
        return;
    }
    if (element.checked) {
        $('#card-product-'+value).addClass('bg-light-primary');
        var html = '';
        html += '<tr id="base-detail-'+value+'">';
        html += '<td class="pe-0">';
        html += '<div class="d-flex align-items-center">';
        html += '<div class="background-partisi w-50px h-50px rounded-3 me-3" style="background-image : url('+image+')"></div>';
        html += '<div class="d-flex justify-content-center align-items-start flex-column">';
        html += '<span class="fw-bold text-gray-800 cursor-pointer text-hover-primary fs-6 me-1">'+title+'</span>';
        html += '<span class="fw-bold cursor-pointer text-primary fs-7 me-1">Rp. <span id="set-money-'+value+'">'+format_uang(price.toString())+'</span></span>';
        html += '<input type="hidden" name="all_price[]" id="hidden-price-'+value+'" class="all_price" value="'+price+'"/>';
        html += '</div>';
        html += '</div>';
        html += '</td>';
        html += '<td class="pe-0">';
        html += '<div class="position-relative d-flex align-items-center">';
        html += '<button type="button" class="btn btn-icon btn-sm btn-light btn-icon-gray-500" onclick="set_qty(this,'+value+')" data-action="min" data-title="'+title+'" data-stock="'+stock+'" data-price="'+price+'"><i class="ki-duotone ki-minus fs-3x"></i></button>';
        html += '<input type="text" class="form-control border-0 text-center px-0 fs-3 fw-bold text-gray-800 w-30px" placeholder="Amount" name="detail['+value+']" readonly="readonly" value="1" />';
        html += '<button type="button" class="btn btn-icon btn-sm btn-light btn-icon-gray-500" onclick="set_qty(this,'+value+')" data-action="plus" data-title="'+title+'" data-stock="'+stock+'" data-price="'+price+'"><i class="ki-duotone ki-plus fs-3x"></i></button>';
        html += '</div></td>';
        html += '</tr>';

        $('#display_order').append(html);
    } else {
        $('#card-product-'+value).removeClass('bg-light-primary');
        $('#base-detail-'+value).remove();
    }
    getTotal();
}


function set_qty(element, id) {
    var price = $(element).data('price');
    var stock = $(element).data('stock');
    var title = $(element).data('title');
    var action = $(element).data('action');
    var now = $('input[name="detail['+id+']"]').val();

   
    if (action == 'min') {
        var final = (Number(now) - 1);
    }else{
        var final = (Number(now) + 1);
    }
     if (Number(final) > Number(stock)) {
        show_alert('warning','<b>'+title+'</b> hanya memiliki stok <b>'+stock+' Item</b>');
        return;
    }
    if (final > 0) {
        $('input[name="detail['+id+']"]').val(final);
        var fp = (Number(price) * Number(final));
        $('#set-money-'+id).text(format_uang(fp.toString()));
        $('#hidden-price-'+id).val(fp);
    }else{
        $('#choose-product-'+id).prop('checked',false);
        $('#choose-product-'+id).trigger('change');
    }
    getTotal();
}

function getTotal() {
    let total = 0;

    $('.all_price').each(function() {
        let val = parseFloat($(this).val()) || 0;
        total += val;
    });
    $('#display_total_order').text(format_uang(total.toString()));
}