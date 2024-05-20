@extends('layouts.admin.tabler')
@section('content')
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2>
                        Master Data Client
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
                                    <a href="#" class="btn btn-primary" id="btnTambahclient">
                                        {{-- Logo Tambah --}}
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                            stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <path d="M12 5l0 14" />
                                            <path d="M5 12l14 0" />
                                        </svg>
                                        Tambah Client
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <form action="/client" method="GET">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <input type="text" name="nama_client" id="nama_client" class="form-control" 
                                                    placeholder="Nama Client" value="{{ Request('nama_client')}}">
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <select name="nik" id="nama_lengkap" class="form-select">
                                                        <option value="">Nama PIC/Manager</option>
                                                            @foreach ($auditors as $d)
                                                                <option {{ Request('nik')==$d->nik ? 'selected' : '' }} 
                                                                value="{{ $d->nik }}">{{$d->nama_lengkap }}</option>
                                                            @endforeach
                                                    </select>
                                                </div>
                                            </div>
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
                                                <th>Kode Client</th>
                                                <th>Nama Client</th>
                                                <th>Alamat</th>
                                                <th>Narahubung</th>
                                                <th>PIC/Manager</th>
                                                <th>Aksi</th>
                                            </thead>
                                            <tbody>
                                                @foreach ($client as $d)
                                                <tr>
                                                    <td>{{ $loop->iteration + $client->firstItem() -1 }}</td>
                                                    <td>{{ $d->kode_client }}</td>
                                                    <td class="nama-client">{{ $d->nama_client}}</td>
                                                    <td class="alamat">{{ $d->alamat}}</td>
                                                    <td class="narahubung">{{ $d->pic_client}} <a href="https://wa.me/{{ addPhonePrefix($d->no_tlpn_client) }}">+{{ addPhonePrefix($d->no_tlpn_client) }}</a> <a href="mailto:{{ $d->email }}" class="text-decoration-none">
                                                        <i class="fas fa-envelope"></i>
                                                        <span class="ms-1">{{ $d->email }}</span>
                                                      </a></td>
                                                    <td class="pic-manager">{{ $d->nama_lengkap }} <b><i>({{ $d->jabatan }})</b></i></td>
                                                    {{-- <td class="tagihan">{{ formatCurrency($d->total_invoice)}}</td> --}}
                                                    <td>
                                                        <div class="d-flex">                                                            
                                                            <div>
                                                                <a href="#" class="edit btn btn-primary btn-sm" kode_client="{{ $d->kode_client}}">
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
                                                                <form action="/client/{{$d->kode_client}}/delete" method="POST" style="margin-left:2px">
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
                                    {{ $client->links('vendor.pagination.bootstrap-5')}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal modal-blur fade" id="modal-inputclient" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Tambah Data Client</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/client/store" method="POST" id="frmClient" enctype="multipart/form-data">
                        @csrf
                        {{-- Kode Client --}}
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
                                    <input type="text" value="" id="kode_client" class="form-control" placeholder="Kode Client" name="kode_client">
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
                                    <input type="text" value="" id="nama_client" class="form-control" placeholder="Nama Client" name="nama_client">
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
                                    <input type="text" value="" id="alamat" class="form-control" placeholder="Alamat" name="alamat">
                                  </div>
                            </div>
                        </div>
                        {{-- Pic Client --}}
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
                                    <input type="text" value="" id="pic_client" class="form-control" placeholder="PIC" name="pic_client">
                                  </div>
                            </div>
                        </div>
                        {{-- No Telepon Client --}}
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
                                    <input type="text" value="" id="no_tlpn_client" class="form-control" placeholder="No Telepon Client" name="no_tlpn_client">
                                  </div>
                            </div>
                        </div>
                        {{-- Email --}}
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
                                    <input type="email" value="" id="email" class="form-control" placeholder="Alamat Email" name="email">
                                  </div>
                            </div>
                        </div>
                        {{-- Nama Karyawan --}}
                        <div class="row">
                            <div class="col-12">
                                <select name="nik" id="nama_lengkap" class="form-select">
                                    <label for=""></label>
                                    <option value="">Nama PIC/Manager</option>
                                    @foreach ($auditors as $d)
                                        <option {{ Request('nik')==$d->nik ? 'selected' : '' }} 
                                        value="{{ $d->nik }}">{{$d->nama_lengkap }}</option>
                                    @endforeach
                                </select>
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
    <div class="modal modal-blur fade" id="modal-editclient" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Data Client</h5>
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
            $("#btnTambahclient").click(function(){
                $("#modal-inputclient").modal("show");
            });

            $(".edit").click(function(){
                var kode_client = $(this).attr('kode_client');
                $.ajax({
                    type:"POST"
                    , url:"/client/edit"
                    , cache:false
                    , data:{
                        _token:"{{ csrf_token(); }}"
                        , kode_client: kode_client
                    },
                    success:function(respond){
                        $("#loadeditform").html(respond);
                    }
                });
                $("#modal-editclient").modal("show");
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

            $("#frmClient").submit(function(){
                var kode_client = $("#kode_client").val();
                var nama_client = $("#nama_client").val();
                var alamat = $("#alamat").val();
                var pic_client = $("#pic_client").val();
                var no_tlpn_client = $("#no_tlpn_client").val();
                var email = $("#email").val();
                var nama_lengkap = $("#frmClient").find("#nama_lengkap").val();
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