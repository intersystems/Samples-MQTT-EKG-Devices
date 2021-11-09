IRISのカラム数の上限は1000。
https://docs.intersystems.com/iris20211/csp/docbookj/DocBook.UI.Page.cls?KEY=GSQL_tables#GSQL_tables_via_classes

python testdata.py
od -t x1 data2.data

Winodws
powershell format-hex data2.data

---

Load test data via ObjectScript
irisowner@bd49998c146a:/opt/irisbuild$ iris session iris -U INTEROP "##class(Util.BinaryHandler).main()"

select records
irisowner@bd49998c146a:/opt/irisbuild$ iris session iris -U INTEROP "##class(%SYSTEM.SQL).Shell()"
SQL Command Line Shell
----------------------------------------------------

The command prefix is currently set to: <<nothing>>.
Enter <command>, 'q' to quit, '?' for help.
[SQL]INTEROP>>select top 10 * from Util.Record
1.      select top 10 * from Util.Record
col1    col2    col3    col4    col5    col6    col7    col8    col9    col10
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226
0       10      100     101     102     3.1400000000000001243   104     8192    65536   99.998999999999995226

10 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0008s/322/832/0ms
          execute time(s)/globals/cmds/disk: 0.0007s/10/2949/0ms
                          cached query class: %sqlcq.INTEROP.cls9
---------------------------------------------------------------------------
[SQL]INTEROP>>q
irisowner@bd49998c146a:/opt/irisbuild$