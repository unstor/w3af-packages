;Copyright 2008 Ulises U. Cu��
;
;Script to generate update w3af.
;
;w3af is free software; you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation version 2 of the License.
;
;w3ad windows installer is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.

;You should have received a copy of the GNU General Public License
;along with w3af; if not, write to the Free Software
;Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 
;
;
;
; 
;General Attributes
SetCompressor /SOLID lzma
SetDatablockOptimize on
CRCCheck on
Name "w3af update"
BrandingText "Andres Riancho - Ulises Cu��"
OutFile "w3af_update.exe"
AutoCloseWindow false
ShowInstDetails show

;Icon main.ico
XPStyle on

;Insertar Informacion de la Version en el Instalador
VIProductVersion "0.7.0.0"
VIAddVersionKey  "ProductName" "w3af update"
VIAddVersionKey  "Comments" "Web Application Attack and Audit Framework"
VIAddVersionKey  "CompanyName" "-"
VIAddVersionKey  "LegalTrademarks" "-"
VIAddVersionKey  "LegalCopyright" "GPL"
VIAddVersionKey  "FileDescription" "The project goal is to create a framework to find and exploit web application vulnerabilities that is easy to use and extend."
VIAddVersionKey  "FileVersion" "svn beta 7"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

Section -Run
	
	SetDetailsPrint both
	DetailPrint "w3af updating..."
	
	DetailPrint "svn cleanup"
	nsExec::ExecToLog '"svn-client\svn.exe" cleanup'
	
	DetailPrint "svn update"
	nsExec::ExecToLog '"svn-client\svn.exe" update'
	
SectionEnd
