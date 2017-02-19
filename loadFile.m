function  loadFile( filename )
    global cipherText monoFrequencyTable biFrequencyTable
    %loads given ciphertext file
    fid = fopen(filename);
    c = textscan(fid, '%c');
    cipherText = c{1}(:) - 'A';
    fclose(fid);
    %computes frequency tables
    biFrequencyTable = findBigrams();
    monoFrequencyTable = monoFrequency(cipherText);

end

