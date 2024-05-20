<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ClientController extends Controller
{
    public function index(Request $request)
    {
        $query = Client::query();
        $query->select('client.*','nama_lengkap','kode_dept','jabatan');
        $query->join('karyawan','client.nik','=','karyawan.nik');
        $query->orderBy('nama_client');
        if(!empty($request->nama_client)){
            $query->where('nama_client','like','%'.$request->nama_client.'%');
        }
        if(!empty($request->nik)){
            $query->where('client.nik', $request->nik);
        }
        $client = $query->paginate(10);
    
        $karyawan = DB::table('karyawan')->get();
        $auditors = $karyawan->filter(function ($item) {
            return $item->kode_dept == 'AUD';
        });
        return view('client.index', compact('client','karyawan','auditors'));
    }

    public function store(Request $request)
    {
        $kode_client  = $request->kode_client;
        $nama_client = $request->nama_client;
        $alamat = $request->alamat;
        $pic_client = $request->pic_client;
        $no_tlpn_client = $request->no_tlpn_client;
        $email = $request->email;
        $nik = $request->nik;
        
        try {
            $data = [
                'kode_client' => $kode_client,
                'nama_client' => $nama_client,
                'alamat' => $alamat,
                'pic_client' => $pic_client,
                'no_tlpn_client' => $no_tlpn_client,
                'email' => $email,
                'nik' => $nik
            ];
            $simpan = DB::table('client')->insert($data);
            if($simpan){

            } return Redirect::back()->with(['success'=>'Data Berhasil Disimpan']);  
        } catch (\Exception $e) {
            // dd($e);
            return Redirect::back()->with(['error'=>'Data Gagal Disimpan']);
        }
    }

    public function edit(Request $request)
    {
        $kode_client = $request->kode_client;
        $karyawan = DB::table('karyawan')->get();
        $managers = $karyawan->filter(function ($item) {
            return $item->kode_dept == 'MRG';
        });
        $client = DB::table('client')->where('kode_client', $kode_client)->first();
        return view('client.edit', compact('karyawan','managers','client'));
    }

    public function update($kode_client, Request $request)
    {
        $kode_client  = $request->kode_client;
        $nama_client = $request->nama_client;
        $alamat = $request->alamat;
        $pic_client = $request->pic_client;
        $no_tlpn_client = $request->no_tlpn_client;
        $email = $request->email;
        $nik = $request->nik;
        
        try {
            $data = [
                'kode_client' => $kode_client,
                'nama_client' => $nama_client,
                'alamat' => $alamat,
                'pic_client' => $pic_client,
                'no_tlpn_client' => $no_tlpn_client,
                'email' => $email,
                'nik' => $nik
            ];
            $update = DB::table('client')->where('kode_client', $kode_client)->update($data);
            if($update){

            } return Redirect::back()->with(['success'=>'Data Berhasil Diupdate']);  
        } catch (\Exception $e) {
            // dd($e);
            return Redirect::back()->with(['error'=>'Data Gagal Diupdate']);
        }
    }

    public function delete($kode_client)
    {
        $delete = DB::table('client')->where('kode_client', $kode_client)->delete();
        if($delete){
            return Redirect::back()->with(['success'=> 'Data Berhasil Dihapus']);
        } else{
            return Redirect::back()->with(['error'=> 'Data Gagal Dihapus']);
        }
    }
    
}
