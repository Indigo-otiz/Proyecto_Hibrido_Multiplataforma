unit Forma_LCD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls,ShellAPI,MMSystem;

type
  TFormaLCD = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Panel2: TPanel;
    btnCerrar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    editPrograma: TEdit;
    memoAsm: TMemo;
    laHora: TLabel;
    editTexto: TEdit;
    btnExportar: TButton;
    Image3: TImage;
    Label4: TLabel;
    procedure btnCerrarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    emu86, enter, apostrofe, inicio, fin, programa: String;
    Archivo: TextFile;
    prog, mensaje: String;
  end;

var
  FormaLCD: TFormaLCD;

implementation

{$R *.dfm}

procedure TFormaLCD.btnCerrarClick(Sender: TObject);
begin
    Close;
end;

procedure TFormaLCD.btnExportarClick(Sender: TObject);
begin
    try
        prog:= 'C:\Users\aneao\Downloads'+editPrograma.Text+'.asm';
        mensaje:= editTexto.Text;
        if (Length(prog)<>0) and (Length(mensaje)<>0) then
        begin
          emu86:= '.model small'+enter+
                  '.stack'+enter+
                  '.data'+enter+
                  'cadena db '+apostrofe+
                  editTexto.Text+apostrofe+enter+
                  '.code'+enter+enter+
                  inicio+enter+enter+
                  'mov dx,2040h'+enter+
                  'mov si,0'+enter+
                  'mov al,cadena[si]'+enter+
                  'out dx,al'+enter+fin;

                  //Creación de archivo
                  AssignFile(Archivo,prog);
                  Rewrite(Archivo);
                  Write(Archivo,emu86);
                  laHora.Caption:='Hora de envío: '+TimeToStr(now);
                  sndPlaySound('C:\Tec\7mo Semestre\Lenguajes y Autómatas II\Proyecto Híbrido Multiplataforma\Sonidos\sonido.wav',snd_filename or snd_async);
                  closeFile(Archivo);
                  memoAsm.Lines.LoadFromFile(prog);
                  //
                  ShellExecute(FormaLCD.handle,nil,pChar(prog),nil,nil,sw_shownormal);
        end
        else
        begin
            ShowMessage('Favor de Proporcionar Datos');
        end; // if-else

    except
        ShowMessage('Error al generar el archivo LCD .asm');
    end; // fin try
end;

procedure TFormaLCD.FormActivate(Sender: TObject);
begin
    enter:= #13#10;
    apostrofe:= '''';
    inicio:= 'mov ax,@data'+enter+
              'mov ds,ax'+enter;

    fin:= 'mov ax,4c00h'+enter+
          'int 21h'+enter+
          'end';
   programa:='';
end;

end.