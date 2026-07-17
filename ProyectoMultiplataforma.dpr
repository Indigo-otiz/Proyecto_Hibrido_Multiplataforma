program ProyectoMultiplataforma;

uses
  Vcl.Forms,
  Forma_Principal in 'Formularios\Forma_Principal.pas' {FormaPrincipal},
  Forma_LCD in 'Formularios\Forma_LCD.pas' {FormaLCD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormaPrincipal, FormaPrincipal);
  Application.CreateForm(TFormaLCD, FormaLCD);
  Application.Run;
end.
