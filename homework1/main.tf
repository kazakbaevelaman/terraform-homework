# # add users to the group 
# resource "aws_iam_group_membership" "team1" {
#   name = "group-membership1"

#   users = [
#     aws_iam_user.jenny.name,
#     aws_iam_user.rose.name,
#     aws_iam_user.lisa.name,
#     aws_iam_user.jisoo.name,
#     aws_iam_user.miyeon.name,
#   ]

#   group = aws_iam_group.blackpink.name

# }

# resource "aws_iam_group_membership" "team2" {
#   name = "tf-testing-group-membership2"

#   users = [
#     aws_iam_user.jihyo.name,
#     aws_iam_user.sana.name,
#     aws_iam_user.momo.name,
#     aws_iam_user.dahyun.name,
#     aws_iam_user.mina.name,
#   ]

#   group = aws_iam_group.twice.name
  
# }

# # user import commands 
# # terraform import aws_iam_user.mina mina
# # terraform import aws_iam_user.miyeon miyeon


# resource "aws_iam_user" "mina" {
#   name = "mina"
# }

# resource "aws_iam_user" "miyeon" {
#    name = "miyeon"
# }
