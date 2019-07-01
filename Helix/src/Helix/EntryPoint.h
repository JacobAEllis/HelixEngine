#pragma once

#ifdef HX_PLATFORM_WINDOWS

extern Helix::Application* Helix::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Helix::CreateApplication();
	app->Run();
	delete app;
}

#endif
