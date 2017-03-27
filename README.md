# dbackres
Auto Database Backup &amp;&amp; Restore With Cronjob

dbackres adalah program aplikasi yang berfungsi sebagai auto restore, auto backup dan auto compress dan berjalan melalui pengecekan database , jika database ada maka akan di backup. jika database tidak ada maka akan di restore secara otomatis dan hasil restore tersebut mengambil dari backup yang terakhir. program ini di jalankan dengan bantuan cronjob (crontab) pada debian atau  ubuntu server.

# Release

Release Info & Changelog   : https://github.com/alintamvanz/dbackres/tree/master/release <br/>
Release Github             : https://github.com/alintamvanz/dbackres/releases

# Installation
<pre>
root@Indonesian:~# git clone https://github.com/alintamvanz/dbackres.git
root@Indonesian:~# cd dbackres
root@Indonesian:~# chmod 755 *
root@Indonesian:~# ./install
</pre>

# Info Configuration
<pre>
BackUp Directory : <i> /var/db_backres/backup/</i>
DB Connect Config: <i> /etc/db_backres/db_alinko.conf </i>pr
Installation Dir : <i> /opt/db_backres/ </i>
Log File         : <i> /var/log/db_backup.log </i>
</pre>
