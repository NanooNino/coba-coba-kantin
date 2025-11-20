let transactionTable;
let currentFilterStartDate = '';
let currentFilterEndDate = '';

document.addEventListener('DOMContentLoaded', function () {
    transactionTable = initGlobalDatatable('#table_transaction', function () {
        return {
            filter_start_date: currentFilterStartDate,
            filter_end_date: currentFilterEndDate
        };
    });

    // Trigger reload on each filter
    document.querySelectorAll('.table-filter').forEach(el => {
        el.addEventListener('change', function () {
            if (transactionTable) transactionTable.ajax.reload();
        });
    });
});


function filter_apply() {
    currentFilterStartDate = $('#start_date').val();
    currentFilterEndDate = $('#end_date').val();

    // Konversi ke objek Date
    const startDate = new Date(currentFilterStartDate);
    const endDate = new Date(currentFilterEndDate);

    // Cek apakah endDate lebih kecil dari startDate
    if (endDate < startDate) {
        show_alert("warning","Tanggal akhir tidak boleh lebih kecil dari tanggal mulai.");
        return; // hentikan eksekusi
    }

    if (transactionTable) {
        transactionTable.ajax.reload();
    }
    $('input[name="start_date"]').val(currentFilterStartDate);
    $('input[name="end_date"]').val(currentFilterEndDate);
}
