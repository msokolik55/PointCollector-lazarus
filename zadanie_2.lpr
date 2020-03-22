program zadanie_2;
uses crt;

var body, x, y, x_bod, y_bod: integer;
    je_koniec, vlavo, vpravo, hore, dole, je_vyhra: boolean;
    ch: char;

procedure vygeneruj_bod;
begin
  gotoxy(1, 1);
  write('Skore: ', body);

  x_bod := random(80) + 1;
  y_bod := random(24) + 2;
  gotoxy(x_bod, y_bod);
  textcolor(14);
  write('O');
  textcolor(15);
end;

begin
  randomize;

  je_koniec := False;
  body := 0;
  x := 2;
  y := 3;

  vpravo := True;
  vlavo := False;
  hore := False;
  dole := False;

  vygeneruj_bod;

  while(not je_koniec) do
  begin
    // vykreslenie 'X'
    gotoxy(x, y);
    write('X');
    delay(100);

    // stlacenie klavesy
    if(keypressed) then
    begin
      ch := readkey;

      if(ch = 'w') or (ch = 'a') or (ch = 's') or (ch = 'd') then
      begin
        vpravo := False;
        vlavo := False;
        hore := False;
        dole := False;
      end;

      case ch of
        'w': hore := True;
        'a': vlavo := True;
        's': dole := True;
        'd': vpravo := True;
      end;
    end;

    // zmazanie 'X'
    gotoxy(x, y);
    write(' ');

    if(vpravo) then x := x + 1;
    if(vlavo) then x := x - 1;
    if(hore) then y := y - 1;
    if(dole) then y := y + 1;

    // zisk 10 bodov
    if(body = 10) then
    begin
      je_koniec := True;
      je_vyhra := True;
    end;

    // narazenie do okraja
    if(x < 1) or (x > 80) or (y < 2) or (y > 25) then
      je_koniec := True;

    // ziskanie bodu
    if(x = x_bod) and (y = y_bod) then
    begin
      body := body + 1;
      vygeneruj_bod;
    end;

  end;

  gotoxy(40, 13);
  if(je_vyhra) then writeln('YOU WIN THE GAME')
  else writeln('GAME OVER');

  readln();
end.

