#parameter

# param(
#     [parameter(mandatory)]
#     [int]$size
# )

#explain how the script will work
# Write-Host "type 0 to find 5 biggest file 
# type file size to find all files above it"

[int]$size = Read-Host "type 0 to find 5 biggest file.
type file size to find all files above it"

#Get all files in current Directory
$allFile = Get-ChildItem . -Recurse -File

#find the 5 biggest file in current folder
if($size -eq 0){
    $toPrint= ($allFile | Select-Object Name,Length | Sort-Object Length -Descending)[0..4]
    Write-Host ""
    foreach($file in $toPrint){
        $theSize = $file.Length/1mb
        Write-Host ""$file.Name" "$theSize.toString("F2")"mb"
    }
}


#print all file above inputed value
if($size -ne 0){
    foreach($file in $allFile){
        $fileSize = $file.Length/1mb
        if($fileSize -gt $size){
            Write-Host ""$file.Name" "$fileSize.toString("F2")"mb"
        }
    }
}

