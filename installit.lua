print("InstallIt v0.1")
while not valid do
print("Input URL to Github repository:")
url = read()
print("Checking...")
valid, urlerr = http.checkURL(url)
if not valid then print("URL invalid:",urlerr)
else print("URL valid!") end
end
print("Checking for index file...")
indexurl= url.."/raw/main/index"
print("Found index:")
request, urlerr = http.get(indexurl, nil, true)
if not request then print("Can't access index:",urlerr) end
print("Saving index to cache...")
if not fs.exists("installit/cache") then print("Cache folder does not exist, creating...") fs.makeDir("installit/cache") end
fs.delete("installit/cache/index")
cache=fs.open("installit/cache/index", "w")
cache.write(request.readAll())
cache.close()
request.close()
cacheread=fs.open("installit/cache/index","r")
print("Index file version "..cacheread.readLine()..", should be 0001")
if not version == 0001 then print("Index version mismatch, this may cause problems.") end
print("Processing index...")

