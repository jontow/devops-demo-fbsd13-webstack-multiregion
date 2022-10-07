resource "aws_lb" "main" {
  name    = var.lb_name
  subnets = [for subnet in aws_subnet.main : subnet.id]

  load_balancer_type = var.lb_type
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_http.arn
  }
}

### ALB TG: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html
### NLB TG: https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html
resource "aws_lb_target_group" "main_http" {
  name        = var.lb_tg_name
  port        = var.lb_tg_port
  protocol    = var.lb_tg_protocol
  target_type = "instance"
  vpc_id      = aws_vpc.main.id
}

### Example of forced redirect http-to-https at listener level:
#resource "aws_lb_listener" "main" {
#  load_balancer_arn = aws_lb.main.arn
#  port              = "80"
#  protocol          = "HTTP"
#
#  default_action {
#    type = "redirect"
#
#    redirect {
#      port        = "443"
#      protocol    = "HTTPS"
#      status_code = "HTTP_301"
#    }
#  }
#}
