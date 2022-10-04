resource "aws_lb" "main" {
  name    = var.alb_name
  subnets = [for subnet in aws_subnet.main : subnet.id]
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_http.arn
  }
}

resource "aws_lb_target_group" "main_http" {
  name        = var.alb_tg_name
  port        = 80
  protocol    = "HTTP"
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
