# Defining the Resource Group
resource "aws_resourcegroups_group" "resource_group" {
  name = "${var.res_group}"
  description = "${var.tag_app_acronym} Resource Group"
  resource_query { 
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "ApplicationAcronym",
      "Values": ["${var.tag_app_acronym}"]
    }
  ]
}
JSON
  }
tags = "${merge(var.default_tags, map("Name",var.res_group),var.tags)}"

}