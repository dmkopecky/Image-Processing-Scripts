dc = dir('*.bmp'); % find all files in current directory
for file = dc'
  fileno = str2double(cell2mat(regexp(file.name, '[0-9]{1,}', 'match')));
  if mod(fileno, 2) == 1, % check if fileno modulo 2 == 1
    delete(file.name);
  end
end