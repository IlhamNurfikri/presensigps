@extends('layouts.admin.tabler')
@section('content')
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2>
                        Data Items
                    </h2>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    @if (Session::get('success'))
                                        <div class="alert alert-success">
                                            {{ Session::get('success') }}
                                        </div>
                                    @endif

                                    @if (Session::get('warning'))
                                        <div class="alert alert-warning">
                                            {{ Session::get('warning') }}
                                        </div>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <a href="#" class="btn btn-primary" id="btnTambahItem">
                                        {{-- Logo Tambah --}}
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                            stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <path d="M12 5l0 14" />
                                            <path d="M5 12l14 0" />
                                        </svg>
                                        Tambah Item
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <form action="/item" method="GET">
                                        <div class="row">
                                            {{-- Search Nama Item --}}
                                            <div class="col-10">
                                                <div class="form-group">
                                                    <input type="text" name="nama_item" id="nama_item" class="form-control" 
                                                    placeholder="Nama Item" value="{{ Request('nama_item')}}">
                                                </div>
                                            </div>
                                            {{-- Search --}}
                                            <div class="col-2">
                                                <div class="form-group">
                                                    <button class="btn btn-primary">
                                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                                            stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-search">
                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                            <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                                            <path d="M21 21l-6 -6" />
                                                        </svg>
                                                        Search
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-stripted table-hover">
                                            <thead>
                                                <th>No</th>
                                                <th>Kode Item</th>
                                                <th>Nama Item</th>
                                                <th>Aksi</th>
                                            </thead>
                                            <tbody>
                                                @foreach ($item as $d)
                                                    
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>{{ $d->kode_item }}</td>
                                                    <td>{{ $d->nama_item }}</td>
                                                    {{-- <td>{{ formatCurrency($d->harga, 2, '.', ',') }}</td> --}}
                                                    <td>
                                                        <div class="d-flex">                                                            
                                                            <div>
                                                                <a href="#" class="edit btn btn-primary btn-sm" nama_item="{{ $d->nama_item}}">
                                                                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  
                                                                    viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                                                    stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  
                                                                    class="icon icon-tabler icons-tabler-outline icon-tabler-edit">
                                                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                                    <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1" />
                                                                    <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z" />
                                                                    <path d="M16 5l3 3" />
                                                                </svg>
                                                            </a>
                                                        </div>  
                                                        <div>
                                                            <form action="/item/{{$d->kode_item}}/delete" method="POST" style="margin-left:2px">
                                                                @csrf                                                                    
                                                                <a class="btn btn-danger btn-sm delete-confirm">
                                                                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  
                                                                    viewBox="0 0 24 24" fill="none"  stroke="currentColor"  
                                                                    stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  
                                                                            class="icon icon-tabler icons-tabler-outline icon-tabler-eraser">
                                                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                                            <path d="M19 20h-10.5l-4.21 -4.3a1 1 0 0 1 0 -1.41l10 -10a1 1 0 0 1 1.41 0l5 5a1 1 0 0 1 0 1.41l-9.2 9.3" />
                                                                            <path d="M18 13.3l-6.3 -6.3" /></svg>
                                                                        </a>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </td>
                                                </tr>
                                                @endforeach
                                             </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal modal-blur fade" id="modal-inputitem" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Tambah Item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/item/store" method="POST" id="frmItem">
                        @csrf
                        {{-- Kode Item --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <span class="input-icon-addon">
                                      <!-- Download SVG icon from http://tabler-icons.io/i/user -->
                                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" 
                                        stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                        <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                      </svg>
                                    </span>
                                    <input type="text" value="" id="kode_item" class="form-control" placeholder="Kode Item" name="kode_item">
                                  </div>
                            </div>
                        </div>
                        {{-- Nama Client --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <span class="input-icon-addon">
                                      <!-- Download SVG icon from http://tabler-icons.io/i/user -->
                                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" 
                                        stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                        <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                      </svg>
                                    </span>
                                    <input type="text" value="" id="nama_item" class="form-control" placeholder="Nama Item" name="nama_item">
                                  </div>
                            </div>
                        </div>
                        {{-- Alamat --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <span class="input-icon-addon">
                                      <!-- Download SVG icon from http://tabler-icons.io/i/user -->
                                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" 
                                        stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                        <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                        <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                      </svg>
                                    </span>
                                    <input type="text" value="" id="harga" class="form-control" placeholder="Harga Item" name="harga">
                                  </div>
                            </div>
                        </div>
                        {{-- Tombol Simpan --}}
                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="form-group">
                                    <button class="btn btn-primary w-100">
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                            stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  
                                            class="icon icon-tabler icons-tabler-outline icon-tabler-send">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <path d="M10 14l11 -11" />
                                            <path d="M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5" />
                                        </svg>
                                        Simpan
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {{-- Modal Edit Client --}}
    <div class="modal modal-blur fade" id="modal-edititem" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Item</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="loadeditform">
                    
                </div>
            </div>
        </div>
    </div>
@endsection

@push('myscript')
    <script>
        $(function(){
            $("#btnTambahItem").click(function(){
                $("#modal-inputitem").modal("show");
            });

            $(".edit").click(function(){
                var kode_item = $(this).attr('kode_item');
                $.ajax({
                    type:"POST"
                    , url:"/item/edit"
                    , cache:false
                    , data:{
                        _token:"{{ csrf_token(); }}"
                        , kode_item: kode_item
                    },
                    success:function(respond){
                        $("#loadeditform").html(respond);
                    }
                });
                $("#modal-edititem").modal("show");
            });

            $(".delete-confirm").click(function(e) {
                var form = $(this).closest('form');
                e.preventDefault();
                Swal.fire({
                    title: 'Apakah Anda Yakin Data Ini Mau Di Hapus ?',
                    text: "Jika Ya Maka Data Akan Terhapus Permanent",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, Hapus Saja!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                        // Swal.fire(
                        //     'Deleted!', 'Data Berhasil Di Hapus', 'success'
                        // )
                    }
                })
            });
            
            $("#frmItem").submit(function(){
                var kode_item = $("#kode_item").val();
                var nama_item = $("#nama_item").val();
                var harga = $("#harga").val();
            //     if (kode_client == "") {
            //         // alert('Nik Harus Diisi');
            //         Swal.fire({
            //             title: 'Kode Client Harus Diisi',
            //             text: 'Gunakan Singkatan Untuk Mempermudah',
            //             icon: 'warning',
            //             confirmButtonText: 'Ok'
            //         }).then((result) => {
            //             $("#kode_client").focus();
            //         });

            //         return false;
            //     } else if (nama_client == "") {
            //         Swal.fire({
            //             title: 'Nama Client Harus Diisi',
            //             text: 'Sesuaikan Dengan Singkatan',
            //             icon: 'warning',
            //             confirmButtonText: 'Ok'
            //         }).then((result) => {
            //             $("#nama_client").focus();
            //         });

            //         return false;
            //     } else if (alamat == "") {
            //         Swal.fire({
            //             title: 'Alamat Harus Diisi',
            //             text: 'Sesuaikan Dengan Alamat Yang Terdaftar',
            //             icon: 'warning',
            //             confirmButtonText: 'Ok'
            //         }).then((result)=>{
            //             $("#alamat").focus();
            //         });
            //     }
            });
        });
    </script>
@endpush