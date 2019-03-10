import code


def main(args):
    print("\033c")
    code.interact(local={**locals(), **globals()})


def handle_result(args, answer, target_window_id, boss):
    code.interact(local={**locals(), **globals()})
