@extends('layouts.admin.tabler')
@section('content')
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h1>
                        Proposal
                    </h1>
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
                                    <a href="#" class="btn btn-primary" id="btnTambahProposal">
                                        {{-- Logo Tambah --}}
                                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  
                                            stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                            <path d="M12 5l0 14" />
                                            <path d="M5 12l14 0" />
                                        </svg>
                                        Proposal Baru
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-12">
                                    <form action="/proposal" method="GET">
                                        <div class="row">
                                            {{-- Search Nomor Proposal --}}
                                            <div class="col-2">
                                                <div class="form-group">
                                                    <input type="text" name="no_proposal" id="no_proposal" class="form-control" 
                                                    placeholder="Nomor Proposal" value="{{ Request('no_proposal')}}">
                                                </div>
                                            </div>
                                            {{-- Search Nama Client --}}
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <select name="kode_client" id="nama_client" class="form-select">
                                                        <option value="">Nama Client</option>
                                                            @foreach ($client as $d)
                                                                <option {{ Request('kode_client')==$d->nama_client ? 'selected' : '' }} 
                                                                value="{{ $d->kode_client }}">{{$d->nama_client }}</option>
                                                            @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            {{-- Search Nama Tanda Tangan --}}
                                            <div class="col-4">
                                                <div class="form-group">
                                                    <select name="nik" id="nama_lengkap" class="form-select">
                                                        <option value="">Nama Tanda Tangan</option>
                                                            @foreach ($partners as $d)
                                                                <option {{ Request('nama_client')==$d->nik ? 'selected' : '' }} 
                                                                value="{{ $d->nik }}">{{$d->nama_lengkap }}</option>
                                                            @endforeach
                                                    </select>
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
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table class="table table-stripred table-hover">
                                            <thead>
                                                <td>No</td>
                                                <td>Tanggal Proposal</td>
                                                <td>Nomor Proposal</td>
                                                <td>Kode Client</td>
                                                <td>Nama Client</td>
                                                <td>Nama Item</td>
                                                <td>Jumlah Harga</td>
                                                <td>Tanda Tangan</td>
                                                <td>Status</td>
                                            </thead>
                                            <tbody>
                                                @foreach ($proposal as $d)
                                                <tr>
                                                        <td>{{ $loop->iteration + $proposal->firstItem() - 1 }}</td>
                                                        <td>{{ $d->tanggal_proposal}}</td>
                                                        <td>{{ $d->no_proposal}}</td>
                                                        <td>{{ $d->kode_client}}</td>
                                                        <td>{{ $d->nama_client}}</td>
                                                        <td>{{ $d->nama_item}}</td>
                                                        <td>{{ formatCurrency($d->harga, 2, '.', ',')}}</td>
                                                        <td>{{ $d->nama_lengkap}}</td>
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
    <div class="modal modal-blur fade" id="modal-inputproposal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Buat Proposal Baru</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/proposal/store" method="POST" id="frmProposal" enctype="multipart/form-data">
                        @csrf
                        {{-- Tanggal Proposal --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <input type="date" value="" id="tanggal_proposal" class="form-control" placeholder="Tanggal Proposal" name="tanggal_proposal">
                                </div>
                            </div>
                        </div>
                        {{-- Nomor Proposal --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <input type="text" value="" id="no_proposal" class="form-control" placeholder="Nomor Proposal" name="no_proposal">
                                </div>
                            </div>
                        </div>
                        {{-- Kode Client --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <select name="kode_client" id="nama_client" class="form-select">
                                        <option value="">Kode Client</option>
                                            @foreach ($client as $d)
                                                <option {{ Request('kode_client')==$d->kode_client ? 'selected' : '' }} 
                                                value="{{ $d->kode_client }}">{{$d->kode_client }}</option>
                                            @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        {{-- Nama Client --}}
                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="form-group">
                                    <select name="kode_client" id="nama_client" class="form-select">
                                        <option value="">Nama Client</option>
                                            @foreach ($client as $d)
                                                <option {{ Request('kode_client')==$d->nama_client ? 'selected' : '' }} 
                                                value="{{ $d->kode_client }}">{{$d->nama_client }}</option>
                                            @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        {{-- Nama Item --}}
                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="form-group">
                                    <select name="kode_item" id="nama_item" class="form-select">
                                        <option value="">Nama Item</option>
                                            @foreach ($item as $d)
                                                <option {{ Request('kode_client')==$d->nama_item ? 'selected' : '' }} 
                                                value="{{ $d->kode_item }}">{{$d->nama_item }}</option>
                                            @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        {{-- Nomor Proposal --}}
                        <div class="row mt-2">
                            <div class="col-12">
                                <div class="input-icon mb-3">
                                    <input type="number" value="" id="harga" class="form-control" placeholder="Harga Proyek" name="harga">
                                </div>
                            </div>
                        </div>
                        {{-- PIC Tanda Tangan --}}
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <select name="nik" id="nama_lengkap" class="form-select">
                                        <option value="">Nama Tanda Tangan</option>
                                            @foreach ($partners as $d)
                                                <option {{ Request('nama_client')==$d->nik ? 'selected' : '' }} 
                                                value="{{ $d->nik }}">{{$d->nama_lengkap }}</option>
                                            @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        {{-- Simpan --}}
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
@endsection
@push('myscript')
    <script>
        $(function(){
            $("#btnTambahProposal").click(function(){
                $("#modal-inputproposal").modal("show");
            });

        });
    </script>
@endpush