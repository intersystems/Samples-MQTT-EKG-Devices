Class Util.BinaryHandler
{

ClassMethod main(file = "/datavol/share/data2.data")
{
#define loop 10000

	Set stream=##class(%Stream.FileBinary).%New()
	Set sc=stream.LinkToFile(file)
	While 'stream.AtEnd {
		Set line=stream.Read(8192)
	}
	Set stream=""  ; close the file

	write "ObjectScript only",!
	kill ^Util.RecordD
	Set st=$ZH
	For seq=1:1:$$$loop { Do ..DecodeAndSave(seq,line) }
	W $ZH-st," seconds",!

	write "CallOut",!
	kill ^Util.RecordD
	Set st=$ZH
	For seq=1:1:$$$loop { Do ..DecodeAndSaveCO(seq,line) }
	W $ZH-st," seconds",!
}

ClassMethod DecodeAndSave(seq, line)
{
#define elementcount 1000
	#;事前に内容がdouble(8バイト)*1000個の単純な配列とわかっていると仮定。
	#;バイナリ処理のために$LIST構造を使用。扱えるのはIEEE64, Integer。
	Set list=""
	For i=0:1:$$$elementcount-1 {
		#; IEEE doubleのハンドリング
		#; 引数lineから、オフセットをずらしながら各要素(8バイト)を取得しdataに格納
		Set data=$Extract(line,i*8+1,i*8+8) 
		#; バイナリをLIST構造として保存
		Set list=list_$C(10)_$C(8)_data
	}
	Set ^Util.RecordD($INCREMENT(^Util.RecordD))=list
}

ClassMethod DecodeAndSaveCO(seq, line)
{
	#;事前に内容がdouble(8バイト)*1000個の単純な配列とわかっていると仮定。
	Set tSC=$ZF(-3,"/home/irisowner/src/callout.so","Decode",seq,line)
}

}
