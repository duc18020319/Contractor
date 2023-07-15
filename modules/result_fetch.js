var contractor_artifact;
var artifact_file = fetch("../artifacts/Contractor_metadata.json")
.then((response) => {
    contractor_artifact = JSON.stringify(response);
})
.catch((error) => console.log("Error: " + error));

function extractResults(jsonFile)
{
    if (JSON.parse(jsonFile) == 'undefined')
    {
        let outputs = jsonFile.output.abi;
        let n = outputs.length;
        return outputs[n - 1];
    }
    else
    {
        let outputs = JSON.parse(jsonFile).output.abi;
        let n = outputs.length;
        return outputs[n - 1];
    }
}
console.log(JSON.parse(contractor_artifact));