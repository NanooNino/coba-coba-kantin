let maTable;
let currentFilterIdProduct = '';

document.addEventListener('DOMContentLoaded', function () {
    maTable = initGlobalDatatable('#table_ma', function () {
        return {
            id_product: currentFilterIdProduct,
        };
    });

    // Trigger reload on each filter
    document.querySelectorAll('.table-filter').forEach(el => {
        el.addEventListener('change', function () {
            if (maTable) maTable.ajax.reload();
        });
    });
});


function filter_apply() {
    currentFilterIdProduct = $('select[name="id_product"]').val();

    if (maTable) {
        maTable.ajax.reload();
    }
    $('select[name="id_product"]').val(currentFilterIdProduct);
}