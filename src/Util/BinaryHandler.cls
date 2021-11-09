Class Util.BinaryHandler
{

ClassMethod main(file = "/datavol/share/data2.data")
{
	kill ^Util.RecordD
	Set stream=##class(%Stream.FileBinary).%New()
	Set sc=stream.LinkToFile(file)
	While 'stream.AtEnd {
		Set line=stream.Read(8192)
	}
	Set stream=""  ; close the file

	Set st=$ZH
	For i=1:1:10000 { Do ..DecodeAndSave(line) }
	W $ZH-st," seconds",!
}

ClassMethod DecodeAndSave(line)
{
	#;事前に内容がFloat64*1000個の単純な配列とわかっていると仮定。
	#;バイナリ処理のために$LIST構造を使用。扱えるのはIEEE64, Integer。
	Set bin=""
	For i=0:1:999 {
		#; Float64(IEEE64)のハンドリング
		Set data=$E(line,i*8+1,i*8+8) Set bin=bin_$C(10)_$C(8)_data
	}
	#; Globalセットは計測時の環境の影響によるブレが大きいので、ローカル変数にセットすることで代替えする。
	Set ^Util.RecordD($INCREMENT(^Util.RecordD))=bin
	#;Set test($INCREMENT(test))=$LISTBUILD("")_bin
}

}
