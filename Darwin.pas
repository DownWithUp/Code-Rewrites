program Darwin;
{$APPTYPE CONSOLE}
{
Darwin - (Delphi Port) win32 address resolution program
by steve hanna v.01 (Delphi port by DownWithUp)
Original C Source @ http://www.vividmachines.com/shellcode/arwin.c
this program finds the absolute address
of a function in a specified DLL.
happy shellcoding!
}
uses
  SysUtils,Windows;
var
  hmodLibName : HMODULE;
  fprcFunction : FARPROC;

begin
  Writeln('darwin - win32 address resolution program - by steve hanna - v.01 (Edit by: DownWithUp)');
  if(ParamCount < 2) then begin
    Writeln(ExtractFileName(ParamStr(0)) + ' <Library Name> <Function Name>');
    Halt(1);
  end;
  hmodLibName := LoadLibrary(PChar(ParamStr(1)));
  if(hmodLibName = 0) then begin
    writeln('Error: could not load library!');
    Halt(1);
  end;
  fprcFunction := GetProcAddress(hmodLibName,PChar(ParamStr(2)));
  if(fprcFunction = nil) then begin
    writeln('Error: could not find the function in the library!');
    //If you look at the original source the word "not" is missing :)
    Halt(1);
  end;
  writeln(format('%s is located at 0x%x in %s',[ParamStr(2),Integer(fprcFunction),ParamStr(1)]));
end.
