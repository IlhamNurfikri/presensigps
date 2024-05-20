<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ItemController extends Controller
{
    public function index(Request $request)
    {
        $nama_item = $request->nama_item;
        $query = Item::query();
        $query->select('*');
        if(!empty($nama_item)){
            $query->where('nama_item', 'like', '%'.$nama_item.'%');
        }
        $item = $query->get();
        // $item = DB::table('item')->orderBy('kode_item')->get();
        return view('item.index', compact('item'));
    }

    public function store(Request $request)
    {
        $kode_item = $request->kode_item;
        $nama_item = $request->nama_item;
        $data = [
            'kode_item' => $kode_item,
            'nama_item' => $nama_item
        ];

        $simpan = DB::table('item')->insert($data);
        if($simpan){
            return Redirect::back()->with(['success'=> 'Data Berhasil Disimpan']);
        } else {
            return Redirect::back()->with(['error'=> 'Data Gagal Disimpan']);
        }
    }

    public function edit(Request $request)
    {
        $kode_item = $request->kode_item;
        $item = DB::table('item')->where('kode_item', $kode_item)->first();
        return view('item.index', compact('item'));
    }

    public function update($kode_item,Request $request)
    {
        $nama_item = $request->nama_item;
        $data = [
            'nama_item' => $nama_item
        ];
        $update = DB::table('item')->where('kode_item', $kode_item)->update($data);
        if($update){
            return Redirect::back()->with(['success'=> 'Data Berhasil Diupdate']);
        } else{
            return Redirect::back()->with(['error'=> 'Data Gagal Diupdate']);
        }
    }

    public function delete($kode_item)
    {
        $hapus = DB::table('item')->where('kode_item', $kode_item)->delete();
        if ($hapus) {
            return Redirect::back()->with(['success' => 'Data Berhasil Di Hapus']);
        } else {
            return Redirect::back()->with(['warning' => 'Data Gagal Di Hapus']);
        }
    }
}
