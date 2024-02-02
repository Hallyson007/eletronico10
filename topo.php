<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">

						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown" onclick="myFunction()">
								<div class="position-relative">
								<i class="fa-solid fa-circle-half-stroke"></i>
								</div>
							</a>
						</li>


						<li class="nav-item dropdown">


						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
								<div class="position-relative">
								<i class="fa-solid fa-cart-shopping fa-1xl"></i>
									<span class="indicator">4</span>
								</div>
							</a>
						</li>


							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
								 <span class="text-dark">Carrinho</span>
              				</a>
						</li>
					</ul>
				</div>

				<script>
					function myFunction() {
					var element = document.body;
					element.classList.toggle("dark-mode");
					}
				</script>

			</nav>