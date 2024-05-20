<?php

namespace App\Http\Controllers;

use App\Models\Proposal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class ProposalController extends Controller
{
    public function index(Request $request)
    {
        $query = Proposal::query();
        $query->select('proposal.*','nama_client','nama_item','harga','nama_lengkap');
        $query->join('client','proposal.kode_client','=','client.kode_client')
        ->join('item','proposal.kode_item','=','item.kode_item')
        ->join('karyawan','proposal.nik','=','karyawan.nik');
        $proposal = $query->paginate(10);
        $karyawan = DB::table('karyawan')->get();
        $client = DB::table('client')->get();
        $item = DB::table('item')->get();
        $partners = $karyawan->filter(function ($item) {
            return $item->kode_dept == 'PRT';
        });

        return view('proposal.index', compact('proposal','client','item','partners'));
    }

    public function store(Request $request)
    {
        $no_proposal = $request->no_proposal;
        $tanggal_proposal = $request->tanggal_proposal;
        $kode_client = $request->kode_client;
        $kode_item = $request->kode_item;
        $nik = $request->nik;
        $harga = $request->harga;
        $existingProposal = DB::table('proposal')->where('no_proposal', $no_proposal)->first();
        if($existingProposal){
            return Redirect::back()->with(['error'=>'Proposal Number Sudah Digunakan']);
        } else{
            $data = [
                'no_proposal' => $no_proposal,
                'tanggal_proposal' => $tanggal_proposal,
                'kode_client' => $kode_client,
                'kode_item' =>$kode_item,
                'nik' => $nik,
                'harga' => $harga,
            ];
            $simpan = DB::table('proposal')->insert($data);
            if($simpan){
                return Redirect::back()->with(['success'=>'Data Berhasil Disimpan']);
            } else {
                return Redirect::back()->with(['error'=>'Data Gagal Disimpan']);
            }
        }
    }
}
