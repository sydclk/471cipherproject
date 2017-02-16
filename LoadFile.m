% Author: Sydney Clark
function  LoadFile( filename )
    global CipherText MonoFrequencyTable BiFrequencyTable
    
    fid = fopen(filename);
    c = textscan(fid, '%c');
    CipherText = c{1}(:) - 'A';
    fclose(fid);
    MonoFrequencyTable = [];
    BiFrequencyTable = [];
end

