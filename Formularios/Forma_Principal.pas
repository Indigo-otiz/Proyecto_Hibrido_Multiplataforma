unit Forma_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, ShellApi;

type
  TFormaPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Button2: TButton;
    btnArbolE: TBitBtn;
    BitBtn2: TBitBtn;
    btnSemantico: TBitBtn;
    btnC3D: TBitBtn;
    btnCompilador: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnArbolEClick(Sender: TObject);
    procedure btnCompiladorClick(Sender: TObject);
    procedure btnC3DClick(Sender: TObject);
    procedure btnSemanticoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormaPrincipal: TFormaPrincipal;

implementation

{$R *.dfm}

uses Forma_LCD;

procedure TFormaPrincipal.btnC3DClick(Sender: TObject);
begin
    try
        ShellExecute(FormaLCD.handle,nil,pChar('..\..\Archivos de Texto\codigo_intermedio_ciscoscript.txt'),nil,nil,sw_shownormal);
    except
          ShowMessage('No se ha encontrado el archivo');
    end;
end;

procedure TFormaPrincipal.btnCompiladorClick(Sender: TObject);
begin
    try
        ShellExecute(FormaLCD.handle,nil,pChar('https://github.com/jeespinosabe/CiscoScript'),nil,nil,sw_shownormal);
    except
          ShowMessage('No se ha encontrado el recurso');
    end;
end;

procedure TFormaPrincipal.btnSemanticoClick(Sender: TObject);
begin
    try
        ShellExecute(FormaLCD.handle,nil,pChar('..\..\Archivos de Texto\reglas-semanticas.txt'),nil,nil,sw_shownormal);
    except
          ShowMessage('No se ha encontrado el archivo');
    end;
end;

procedure TFormaPrincipal.BitBtn2Click(Sender: TObject);
begin
    try
        ShellExecute(FormaLCD.handle,nil,pChar('https://drive.google.com/file/d/1RG2YEWqMv7_hr_oGvsk8OZrWa-Dg01cr/view?usp=drivesdk'),nil,nil,sw_shownormal);
    except
          ShowMessage('No se ha el recurso');
    end;
end;

procedure TFormaPrincipal.btnArbolEClick(Sender: TObject);
begin
    try
        ShellExecute(FormaLCD.handle,nil,'java',pChar('-jar "..\..\Árbol Expresiones Java\ArbolExpresiones.jar"'),nil,sw_shownormal);
    except
          ShowMessage('No se ha encontrado la App');
    end;
end;

procedure TFormaPrincipal.Button1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFormaPrincipal.Button2Click(Sender: TObject);
begin
    FormaLCD.Show;
end;

end.
